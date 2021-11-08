import 'dart:convert';

import 'package:http/http.dart';

import 'api_response.dart';

class ApiException implements Exception {
  final int? statusCode;
  final String? message;
  final dynamic errors;

  ApiException({
    this.statusCode,
    this.message,
    this.errors,
  });

  factory ApiException.fromResponse(Response response) {
    Map body = json.decode(response.body);
    return ApiException(
      statusCode: response.statusCode,
      message: body['message'] ?? null,
      errors: body['errors'] ?? null,
    );
  }
  factory ApiException.fromApiResponse(ApiResponse response) {
    Map body = response.result;
    return ApiException(
      statusCode: response.statusCode,
      message: body['message'] ?? null,
      errors: body['errors'] ?? null,
    );
  }

  @override
  String toString() {
    String errorMessage = "";
    int count = 0;
    Map<String, dynamic>.from(errors ?? {}).values.forEach((element) {
      if (count > 0) {
        errorMessage += '\n';
      }

      if (element is List) {
        errorMessage += element.join('\n');
      } else {
        errorMessage += element.toString();
      }
      count += 1;
    });
    return errorMessage;
  }
}
