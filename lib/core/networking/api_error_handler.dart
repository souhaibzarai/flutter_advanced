// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout with the server');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: 'Send timeout in connection with the server',
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: 'Recieve timeout in connection with the server',
          );
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request to the server was cancelled');

        case DioExceptionType.unknown:
          return ApiErrorModel(message: 'Connection to server failed');
        case DioException.connectionError:
          return ApiErrorModel(message: 'Connection to server failed');
        default:
          return ApiErrorModel(message: 'Unknown Error occurred');
      }
    } else {
      return ApiErrorModel(message: 'Unknown Error occurred');
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? 'Unknown Error occurred',
    code: data['code'],
    errors: data['data'],
  );
}
