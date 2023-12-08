import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dio = Dio()
  ..interceptors.add(PrettyDioLogger(
    request: false,
    requestHeader: false,
    requestBody: true,
    responseBody: false,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ));
