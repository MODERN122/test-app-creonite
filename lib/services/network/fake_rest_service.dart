import 'dart:math';

import 'api_exception.dart';
import 'api_response.dart';
import 'i_rest_service.dart';

///фейковый сервис апи, данные в классе _FakeData можно отредактировать
class FakeRestService implements IRestService {
  String? _token;
  final Random _random = Random();

  @override
  set bearerToken(String token) {
    _token = token;
  }

  @override
  void deleteToken() {
    _token = null;
  }

  //вернет исключение с вероятностью 1/5
  Future<ApiResponse> _returnResponse(ApiResponse response,
      {bool random = false, bool throwErrorWithoutToken = false}) async {
    int r = random ? _random.nextInt(5) : 1;
    await Future.delayed(const Duration(milliseconds: 300));
    if (throwErrorWithoutToken && (_token?.isEmpty ?? true)) {
      r = 0;
    }
    if (r == 0) throw ApiException(statusCode: 404, message: 'Возникла ошибка');
    return response;
  }

  @override
  Future<ApiResponse> getCategoryList() {
    // TODO: implement getCategoryList
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getProductList(
      {int? categoryId,
      int? colorId,
      required int page,
      required int limit,
      int? minPrice,
      int? maxPrice}) {
    // TODO: implement getProductList
    throw UnimplementedError();
  }
}
