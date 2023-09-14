import 'dart:io';

import 'package:dio/dio.dart';

/// Created by Balaji Malathi on 29-09-2022 at 16:21.

mixin class ApiBaseHelper {
  static String getDioException(e) {
    if (e is Exception) {
      try {
        String networkExceptions = "";
        if (e is DioError) {
          switch (e.type) {
            case DioErrorType.cancel:
              networkExceptions = "Request Cancelled";
              break;
            case DioErrorType.connectionTimeout:
              networkExceptions = "Connection request timeout";
              break;
            case DioErrorType.unknown:
              networkExceptions =
                  "This action could not be performed right now";
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = "Send timeout in connection with API server";
              break;
            case DioErrorType.badResponse:
              switch (e.response?.statusCode) {
                case 400:
                  networkExceptions = "This action could not be performed";
                  break;
                case 401:
                  networkExceptions = "This action could not be performed";
                  break;
                case 403:
                  networkExceptions = "Unauthorised request";
                  break;
                case 404:
                  networkExceptions = "Not found";
                  break;
                case 409:
                  networkExceptions = "Error due to a conflict";
                  break;
                case 408:
                  networkExceptions = "Request timeout";
                  break;
                case 500:
                  networkExceptions = "Unable to process your request";
                  break;
                case 503:
                  networkExceptions = "Service unavailable";
                  break;
                default:
                  var responseCode = e.response?.statusCode;
                  networkExceptions =
                      "Received invalid status code: $responseCode";
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = "Send timeout in connection with API server";
              break;
            case DioErrorType.badCertificate:
              // TODO: Handle this case.
              break;
            case DioErrorType.connectionError:
              // TODO: Handle this case.
              break;
          }
        } else if (e is SocketException) {
          networkExceptions = "No internet connection";
        } else {
          networkExceptions = "Unexpected error occurred.";
        }
        return networkExceptions;
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return "Unexpected error occurred..";
      } catch (_) {
        return "Unexpected error occurred...";
      }
    } else {
      if (e.toString().contains("is not a subtype of")) {
        return "Unexpected error occurred";
      } else {
        return "Unable to process the data";
      }
    }
  }

  static String getResponseMessages(statusCode) {
    String networkExceptions = "";

    switch (statusCode) {
      case 400:
        networkExceptions = "This action could not be performed";
        break;
      case 401:
        networkExceptions = "Unauthorised request";
        break;
      case 403:
        networkExceptions = "Unauthorised request";
        break;
      case 404:
        networkExceptions = "Not found";
        break;
      case 409:
        networkExceptions = "Error due to a conflict";
        break;
      case 408:
        networkExceptions = "Request timeout";
        break;
      case 500:
        networkExceptions = "Unable to process your request";
        break;
      case 503:
        networkExceptions = "Service unavailable";
        break;
      default:
        "Received invalid status code: $statusCode";
    }

    return networkExceptions;
  }
}
