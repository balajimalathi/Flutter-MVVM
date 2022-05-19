import 'package:buildbase/core/constants/app/app_contansts.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  static final String url = ApplicationConstants.BASE_URL;

  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  // static Dio addInterceptors(Dio dio) {
  //   return dio
  //     ..interceptors.add(
  //       InterceptorsWrapper(
  //           onRequest: (options, handler) => requestInterceptor(options),
  //           onResponse: (response, handler) =>
  //               responseInterceptor(response, handler),
  //           onError: (e, handler) async {
  //             print("Interceptor Error" + e.toString());
  //           }),
  //     );
  // }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    // const token = '';
    // options.headers.addAll({"Authorization": "Bearer $token"});
    return options;
  }

  static dynamic responseInterceptor(response, handler) async {
    return handler.next(response);
  }

  static final dio = createDio();
  // static final baseAPI = addInterceptors(dio);
  static final baseAPI = createDio();

  Future<Response> get(String url) async {
    print(url);

    try {
      Response response = await baseAPI.get(url);
      return response;
    } on DioError catch (e) {
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: url));
    }
  }

  Future<Response> post(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioError catch (e) {
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: url));
    }
  }

  Future<Response> put(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response;
    } on DioError catch (e) {
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: url));
    }
  }

  Future<Response> delete(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioError catch (e) {
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: url));
    }
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
