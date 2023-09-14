import 'package:colorize/colorize.dart';
import 'package:dio/dio.dart';

import '../../../config.dart';
import '../../../product/navigation/route_constant.dart';
import '../../../product/routes/network_route.dart';
import '../../cache/local_manager.dart';
import '../../constants/enums/pref.dart';
import '../../navigation/router_service.dart';

/// Created by Balaji Malathi on 9/14/2023 at 11:00 PM.
class AuthInterceptor extends Interceptor {
  /// Token [Dio] is used to get new token without Token
  static Dio dio = createDio();

  static Dio createDio() {
    String baseURL = LocalManager.instance.getBool(Pref.switcher)
        ? Config.localURL
        : Config.stageURL;

    BaseOptions opts = BaseOptions(
      baseUrl: baseURL,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      contentType: "application/json",
      receiveTimeout: const Duration(seconds: 30),
    );

    return Dio(opts);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = LocalManager.instance.getString(Pref.authToken);
    options.headers.addAll({"Authorization": "Bearer $token"});
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Colorize string =
        Colorize("Response | Status code:${response.statusCode.toString()}")
            .bold()
            .cyan();
    print(string);
    return handler.next(response); // continue
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    /// Get Retry Limit
    /// Default: 1
    int retryCount = LocalManager.instance.getRetryCount();
    Colorize string = Colorize(
            "Response | Status code:${err.response?.statusCode.toString()}")
        .cyan();
    print(string);

    /// Refresh token
    if (err.response?.statusCode == 401 && retryCount > 0) {
      String refToken = LocalManager.instance.getString(Pref.refreshToken);

      Colorize string = Colorize(
              "Refreshing | Status code:${err.response?.statusCode.toString() ?? "EMPTY"}")
          .red();
      print(string);

      LocalManager.instance.setRetryCount(0);

      /// Requesting new token
      Response tokenResp =
          await dio.post(NetworkRoute.refreshToken, data: {"refreshToken": refToken});

      switch (tokenResp.statusCode) {
        case 200:
          var token = tokenResp.data["jwt"];
          var refreshToken = tokenResp.data["refreshToken"];
          LocalManager.instance.setString(Pref.authToken, token);
          LocalManager.instance.setString(Pref.refreshToken, refreshToken);

          /// Resetting retry count
          LocalManager.instance.setRetryCount(1);
          break;
        default:
          return handler.next(err);
      }

      /// Creating options and request object to retry the request which was failed previously
      final options = Options(
        method: err.requestOptions.method,
        headers: err.requestOptions.headers,
      );
      var req = dio.request<dynamic>(err.requestOptions.path,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
          options: options);

      /// Retrying request
      return handler.resolve(await req);
    } else if (err.response?.statusCode == 404 ||
        err.response?.statusCode == 400) {
      return handler.next(err);
    } else if (err.response?.statusCode == 401) {
      /// Reset the local storage
      LocalManager.instance.clearAll();

      /// Navigate the user to Login screen
      RouterService.instance.pushAndClear(RouterConstant.root);
    }

    return handler.next(err);
  }
}
