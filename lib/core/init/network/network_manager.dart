import 'package:dio/dio.dart';

class NetworkManager {
  static final String url = 'BASE_URL';

  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: (options, handler) => requestInterceptor(options),
            onError: (e, handler) async {
              // if (e.response?.statusCode == 401) {
              //   try {
              //     await dio
              //         .post(
              //         "https://refresh.api",
              //         data: jsonEncode(
              //             {"refresh_token": refreshtoken}))
              //         .then((value) async {
              //       if (value.statusCode == 201) {
              //         //get new tokens ...
              //         print("access token" + token);
              //         print("refresh token" + refreshtoken);
              //         //set bearer
              //         e.requestOptions.headers["Authorization"] =
              //             "Bearer " + token;
              //         //create request with new access token
              //         final opts = new Options(
              //             method: e.requestOptions.method,
              //             headers: e.requestOptions.headers);
              //         final cloneReq = await dio.request(e.requestOptions.path,
              //             options: opts,
              //             data: e.requestOptions.data,
              //             queryParameters: e.requestOptions.queryParameters);
              //
              //         return handler.resolve(cloneReq);
              //       }
              //       return e;
              //     });
              //     return dio;
              //   } catch (e, st) {
              //
              //   }
              // }
            }
            // onError: (e, handler) async {
            //   return e.response.data;
            // }
            ),
      );
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token = '';
    options.headers.addAll({"Authorization": "Bearer $token"});
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> get(String url) async {
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
