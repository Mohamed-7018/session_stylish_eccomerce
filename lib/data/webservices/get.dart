import 'dart:io'; // Importing Dart's IO library for SocketException
import 'package:dio/dio.dart';
import 'package:session_stylish_eccomerce/data/webservices/http_request.dart';

/// A class implementing the HttpMethod abstract class for performing HTTP GET requests.
class GetMethod implements HttpMethod {
  @override
  /// Executes an HTTP GET request using Dio.
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
  }) async {
    try {
      // Perform GET request using Dio
      Response response = await dio.get(
        url,
        queryParameters: queryParameters,
      );
      return response;
    } on SocketException catch (error) {
      // If a SocketException occurs, rethrow it with a meaningful message
      throw SocketException("Socket Exception: ${error.message}");
    } on FormatException catch (_) {
      // If a FormatException occurs, throw a new one with a specific message
      throw const FormatException('Unable to process the data');
    } catch (error) {
      // For any other type of exception, rethrow it to propagate the error
      rethrow;
    }
  }
}
