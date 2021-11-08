import 'package:loading_more_list/loading_more_list.dart';
import 'package:test_creonit/models/category.dart';
import 'package:test_creonit/models/product.dart';
import 'package:test_creonit/services/network/i_rest_service.dart';
import 'package:test_creonit/services/network/network_service.dart';

class PaginationLoadingRepository extends LoadingMoreBase<Product> {
  PaginationLoadingRepository({this.category});
  final Category? category;
  int pageindex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  @override
  bool get hasMore => (_hasMore && length < 30) || forceRefresh;
  final IRestService _restService = NetworkServiceFactory.getInstance();

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    pageindex = 1;
    //force to refresh list when you don't want clear list before request
    //for the case, if your list already has 20 items.
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    String url = "";
    bool isSuccess = false;
    try {
      var response = await _restService.getProductList(
          categoryId: category?.id, page: pageindex, limit: 10);

      var source = ProductList.fromJson(response.result);
      if (pageindex == 1) {
        clear();
      }
      for (var item in source.items) {
        if (hasMore) {
          add(item);
        }
      }

      _hasMore = source.pagination.page < source.pagination.pages;
      pageindex++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      print(exception);
      print(stack);
    }
    return isSuccess;
  }
}
