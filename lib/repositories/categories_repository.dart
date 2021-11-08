import 'package:test_creonit/models/category.dart';
import 'package:test_creonit/services/network/api_response.dart';
import 'package:test_creonit/services/network/i_rest_service.dart';
import 'package:test_creonit/services/network/network_service.dart';

class CategoriesRepository {
  CategoriesRepository._();
  static final CategoriesRepository _instance = CategoriesRepository._();

  factory CategoriesRepository() => _instance;

  final IRestService _restService = NetworkServiceFactory.getInstance();

  CategoryList? _categories;

  fetchAll() async {
    return await Future.wait([
      fetchCategories(),
    ]);
  }

  Future<CategoryList> fetchCategories() async {
    ApiResponse response = await _restService.getCategoryList();
    _categories = CategoryList.fromJson(response.result);
    return _categories!;
  }

  CategoryList? get categories => _categories;
}
