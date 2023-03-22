import 'dart:async';

import 'package:colorize/colorize.dart';
import 'package:dio/dio.dart';
import 'interceptors/logInterceptor.dart';

class MockNetworkManager {
  static Dio createDio() {
    String baseURL = "https://7aeaf8db-fb53-4207-a0ba-ce568e6f86d0.mock.pstmn.io/api/";

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

          // String token =
          // LocalManager.instance.getStringValue(PreferencesKeys.TOKEN);
          // options.headers.addAll({"Authorization": "Bearer $token"});
          // Do something before request is sent
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        }, onResponse: (response, handler) async {
          // Do something with response data
          Colorize string = Colorize(
              "Response | Status code:${response.statusCode.toString()}")
              .bold()
              .cyan();
          print(string);
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        }, onError: (DioError e, handler) async {
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
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
}
