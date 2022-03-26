import 'package:dio/dio.dart';

class HttpProviderDio {
  final Dio http;

  HttpProviderDio({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String contentType = 'application/json; charset=utf-8',
    bool followRedirects = true,
    int maxRedirects = 5,
  }) : http = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: connectTimeout.inMilliseconds,
          receiveTimeout: receiveTimeout.inMilliseconds,
          sendTimeout: sendTimeout?.inMilliseconds,
          responseType: responseType,
          contentType: contentType,
          followRedirects: followRedirects,
          maxRedirects: maxRedirects,
        ));
}
