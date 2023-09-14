import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:buildbase/core/cache/local_manager.dart';
import 'package:buildbase/core/constants/enums/pref.dart';
import 'package:buildbase/core/network/interceptors/log_interceptor.dart';

import '../../config.dart';
import 'interceptors/auth_interceptor.dart';

class NetworkManager {
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

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.addAll([
        AuthInterceptor(),
        LoggingInterceptors()
      ]);
  }

  /// Main [Dio] object
  static Dio dio = createDio();

  /// Adding Interceptors to the Main [Dio]
  static final baseAPI = addInterceptors(dio);

  switchUrl() {
    String baseURL = LocalManager.instance.getBool(Pref.switcher)
        ? Config.localURL
        : Config.stageURL;

    dio.options.baseUrl = baseURL;
  }

  Future<Response> get(String url) async {
    try {
      Response response = await baseAPI.get(url);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> post(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> put(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response;
    } on DioException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  Future<Response> delete(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioException {
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
}
