import 'dart:convert';
import 'dart:developer';

import 'package:test_creonit/app_config.dart';
import 'package:test_creonit/services/network/api_exception.dart';

import 'api_response.dart';
import 'api_request.dart';
import 'package:http/http.dart';

import 'rest_method.dart';

abstract class IRequestSender {
  set bearerToken(String token);
  void deleteToken();

  Future<ApiResponse> sendRequest(ApiRequest request);
}

class RequestSenderFactory {
  static final IRequestSender _instance = RequestSender();

  static IRequestSender getInstance() => _instance;
}

class RequestSender implements IRequestSender {
  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  @override
  Future<ApiResponse> sendRequest(ApiRequest request) async {
    Client client = Client();
    var uri = Uri.https(
        AppConfig.endpoint, '/api${request.path}', request.queryParameters);

    final String body = json.encode(request.body??"");

    late Future requestFuture;

    switch (request.method) {
      case RestMethod.get:
        requestFuture = client.get(
          uri,
          headers: _headers,
        );
        break;
      case RestMethod.post:
        requestFuture = client.post(
          uri,
          headers: _headers,
          body: body,
        );
        break;
      case RestMethod.patch:
        requestFuture = client.patch(
          uri,
          headers: _headers,
          body: body,
        );
        break;
      case RestMethod.delete:
        requestFuture = client.delete(
          uri,
          headers: _headers,
        );
        break;
      case RestMethod.put:
        requestFuture = client.put(
          uri,
          headers: _headers,
          body: body,
        );
        break;
    }

    late Response response;
    if (AppConfig.debugApiRequest) {
      log('╔════HTTP Request ═══════-');
      log('║ URL:     $uri');
      log('║ headers: $_headers');
      log('║ body:    $body');
      log('║ method:  ${request.method}');
      log('╚═══════════════════════─');
    }

    try {
      if (request.withTimeout) {
        response = await requestFuture.timeout(
            const Duration(seconds: AppConfig.requestTimeout), onTimeout: () {
          throw ApiException(
              message: 'Превышено время ожидания ответа от сервера',
              statusCode: 504);
        });
      } else {
        response = await requestFuture;
      }
    } catch (e) {
      if (AppConfig.debugApiRequest) {
        log('╔═══════ HTTP ERROR ═══════-');
        log('║ URL:     $uri');
        log('║ headers: $_headers');
        log('║ body:    $body');
        log('║ method:  ${request.method}');
        log('║ ERROR:   $e');
        log('╚══════════════════════════─');
      }
      throw ApiException(message: e.toString());
    }

    ApiResponse apiResponse = ApiResponse.fromResponse(response);
    if (AppConfig.debugApiRequest) {
      log('╔═══════ HTTP Response ═══════-');
      log('║ URL:      $uri');
      log('║ headers:  $_headers');
      log('║ body:     $body');
      log('║ method:   ${request.method}');
      log('║ response: ${apiResponse.toString().substring(0, 150)}');
      log('╚═════════════════════════════─');
    }

    return apiResponse;
  }

  @override
  set bearerToken(String token) {
    _headers['Authorization'] = 'Bearer $token';
  }

  @override
  void deleteToken() {
    _headers.remove('Authorization');
  }
}
