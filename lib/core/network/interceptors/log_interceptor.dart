import 'dart:convert';

import 'package:colorize/colorize.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptors extends Interceptor {
  static requestPrinter(String? value) {
    var response =
        Colorize(value ?? "=======================================").yellow();
    if (kDebugMode) {
      print(response);
    }
  }

  static responsePrinter(String? value) {
    var response =
        Colorize(value ?? "=======================================").green();
    if (kDebugMode) {
      print(response);
    }
  }

  static errorPrinter(String? value) {
    var response =
        Colorize(value ?? "=======================================").red();
    if (kDebugMode) {
      print(response);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    requestPrinter(null);
    requestPrinter(
        "--> ${options.method.toUpperCase()} METHOD | URL: ${(options.baseUrl) + (options.path)}");
    requestPrinter("Headers:");
    options.headers.forEach((k, v) => requestPrinter('$k: $v'));
    requestPrinter("Query Parameters:");
    options.queryParameters.forEach((k, v) => requestPrinter('$k: $v'));
    if (options.data != null) {
      requestPrinter("Body: ${options.data}");
    }
    requestPrinter("--> END ${options.method} METHOD");
    requestPrinter(null);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    responsePrinter(null);
    responsePrinter(
        "<-- ${response.statusCode} ${response.requestOptions.path}");
    responsePrinter("Response: ${json.encode(response.data)}");
    responsePrinter("<-- END");
    responsePrinter(null);
    return handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    errorPrinter(null);
    errorPrinter("${err.message} ${err.requestOptions.path}");
    errorPrinter("${err.response}");
    errorPrinter("====== End error ======");
    errorPrinter(null);
    return handler.resolve(err.response!); //continue
  }
}
