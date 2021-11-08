import 'package:test_creonit/services/network/api_response.dart';

abstract class IRestService {
  set bearerToken(String token);

  void deleteToken();

  Future<ApiResponse> getCategoryList();
  Future<ApiResponse> getProductList({
    int? categoryId,
    int? colorId,
    required int page,
    required int limit,
    int? minPrice,
    int? maxPrice,
  });
}
