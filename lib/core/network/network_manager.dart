import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:colorize/colorize.dart';
import 'package:dio/dio.dart';
import 'package:buildbase/core/cache/local_manager.dart';
import 'package:buildbase/core/constants/enums/preferences_keys_enum.dart';
import 'package:buildbase/core/navigation/navigation_service.dart';
import 'package:buildbase/core/network/interceptors/logInterceptor.dart';

import '../../product/navigation/navigation_constants.dart';
import '../constants/app/app_constants.dart';

class NetworkManager {
  static Dio createDio() {
    String baseURL = LocalManager.instance.getBoolValue(PreferencesKeys.switcher)
        ? ApplicationConstants.localURL
        : ApplicationConstants.stageURL;

    BaseOptions opts = BaseOptions(
      baseUrl: baseURL,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      contentType: "application/json",
      receiveTimeout: const Duration(seconds: 30),
    );

    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.addAll([
        InterceptorsWrapper(onRequest: (options, handler) {
          String token =
              LocalManager.instance.getStringValue(PreferencesKeys.authToken);
          options.headers.addAll({"Authorization": "Bearer $token"});
          return handler.next(options); //continue
        }, onResponse: (response, handler) async {
          Colorize string = Colorize(
                  "Response | Status code:${response.statusCode.toString()}")
              .bold()
              .cyan();
          print(string);
          return handler.next(response); // continue
        }, onError: (DioError e, handler) async {
          /// Get Retry Limit
          /// Default: 1
          int retryCount = LocalManager.instance.getRetryCount();
          Colorize string = Colorize(
                  "Response | Status code:${e.response?.statusCode.toString()}")
              .cyan();
          print(string);

          /// Refresh token
          if (e.response?.statusCode == 401 && retryCount > 0) {
            String refToken =
                LocalManager.instance.getStringValue(PreferencesKeys.refreshToken);

            Colorize string = Colorize(
                    "Refreshing | Status code:${e.response?.statusCode.toString() ?? "EMPTY"}")
                .red();
            print(string);

            LocalManager.instance.setRetryCount(0);

            /// Requesting new token
            Response tokenResp = await tokenDio
                .post("auth/refreshtoken", data: {"refreshToken": refToken});

            switch (tokenResp.statusCode) {
              case 200:
                var token = tokenResp.data["jwt"];
                var refreshToken = tokenResp.data["refreshToken"];
                LocalManager.instance
                    .setStringValue(PreferencesKeys.authToken, token);
                LocalManager.instance
                    .setStringValue(PreferencesKeys.refreshToken, refreshToken);

                /// Resetting retry count
                LocalManager.instance.setRetryCount(1);
                break;
              default:
                return handler.next(e);
            }

            /// Creating options and request object to retry the request which was failed previously
            final options = Options(
              method: e.requestOptions.method,
              headers: e.requestOptions.headers,
            );
            var req = dio.request<dynamic>(e.requestOptions.path,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters,
                options: options);

            /// Retrying request
            return handler.resolve(await req);
          } else if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
            return handler.next(e);
          } else if (e.response?.statusCode == 401) {
            /// Reset the local storage
            LocalManager.instance.clearAll();

            /// Navigate the user to Login screen
            NavigationService.instance
                .navigateToPageClear(NavigationConstants.root);
          }

          return handler.next(e);
        }),
        LoggingInterceptors()
      ]);
  }

  /// Token [Dio] is used to get new token without Token
  static Dio tokenDio = createDio();

  /// Main [Dio] object
  static Dio dio = createDio();

  /// Adding Interceptors to the Main [Dio]
  static final baseAPI = addInterceptors(dio);

  switchUrl() {
    String baseURL = LocalManager.instance.getBoolValue(PreferencesKeys.switcher)
        ? ApplicationConstants.localURL
        : ApplicationConstants.stageURL;

    tokenDio.options.baseUrl = baseURL;
    dio.options.baseUrl = baseURL;
  }

  Future<Response> get(String url) async {
    try {
      Response response = await baseAPI.get(url);
      return response;
    } on DioError {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> post(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioError {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> put(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response;
    } on DioError {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> delete(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioError {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  toJson(data) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(data);
    log(prettyprint);
  }

// Future<Response> POST_MULTIPART(String url, dynamic data, String dat) async {
//   try {
//     Response response = await baseAPI.post(url, data: data);
//     return response;
//   } on DioError catch (e) {
//     return Response(
//         statusCode: 500, requestOptions: RequestOptions(path: url));
//   }
// }

}
