import 'package:test_creonit/services/network/api_exception.dart';

import 'api_request.dart';
import 'api_response.dart';
import 'i_rest_service.dart';
import 'request_sender.dart';

class RestService implements IRestService {
  final IRequestSender _router = RequestSenderFactory.getInstance();

  @override
  set bearerToken(String token) {
    _router.bearerToken = token;
  }

  @override
  void deleteToken() {
    _router.deleteToken();
  }

  ApiResponse _checkSuccessResponse(ApiResponse response) {
    if (response.statusCode == 401) {
      deleteToken();
      //Storage().deleteToken();
      throw ApiException.fromApiResponse(response);
    } else if (response.statusCode ~/ 100 != 2) {
      throw ApiException.fromApiResponse(response);
    } else {
      return response;
    }
  }

  @override
  Future<ApiResponse> getCategoryList() async {
    ApiRequest request = ApiRequest.simpleGet('/productCategories');
    ApiResponse response = await _router.sendRequest(request);
    return _checkSuccessResponse(response);
  }

  @override
  Future<ApiResponse> getProductList(
      {int? categoryId,
      int? colorId,
      required int page,
      required int limit,
      int? minPrice,
      int? maxPrice}) async {
    var queryParameters = {
      "categoryId": categoryId.toString(),
      "colorId": colorId.toString(),
      "page": page.toString(),
      "limit": limit.toString(),
      "minPrice": minPrice.toString(),
      "maxPrice": maxPrice.toString(),
    };
    ApiRequest request =
        ApiRequest.simpleGet('/products', queryParameters: queryParameters);
    ApiResponse response = await _router.sendRequest(request);
    return _checkSuccessResponse(response);
  }
}
