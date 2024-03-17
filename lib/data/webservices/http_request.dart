import 'package:dio/dio.dart';

/// Abstract class defining a blueprint for HTTP request methods.
abstract class HttpMethod {
  /// Executes an HTTP request using Dio.
  ///
  /// [dio]: An instance of Dio, a powerful HTTP client for Dart.
  /// [url]: The URL to which the HTTP request will be sent.
  /// [queryParameters]: (Optional) The query parameters to be sent with the request.
  ///
  /// Returns a Future that completes with a Response object from Dio.
  Future<Response> doHttpRequest({
    required Dio dio,
    required String url,
    Map<String, dynamic>? queryParameters,
  });
}
