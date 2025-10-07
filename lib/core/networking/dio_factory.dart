import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  const DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const Duration timeout = Duration(seconds: 20);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzU5Nzk2MjU3LCJleHAiOjE3NTk4ODI2NTcsIm5iZiI6MTc1OTc5NjI1NywianRpIjoiRURRM1lXRDl3aWhoZ0xobSIsInN1YiI6IjUyNDUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.E9G1c5zEwmeHEnQS6jn9arneXxAlWGQg4Pdv6G2Egoo',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
