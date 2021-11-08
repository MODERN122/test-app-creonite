import 'dart:convert';

import 'package:http/http.dart';

class ApiResponse {
  final int statusCode;
  final dynamic result;

  ApiResponse({
    required this.statusCode,
    this.result,
  });

  factory ApiResponse.fromResponse(Response response) => ApiResponse(
    statusCode: response.statusCode, 
    result: json.decode(response.body)
  );

  @override
  String toString() {
    return 'ApiResponse(statusCode: $statusCode, result: $result)';
  }
}
