part of 'category_list_bloc.dart';

@immutable
abstract class CategoryListState {}

class CategoryListInitial extends CategoryListState {}

class GetCategoryListError extends CategoryListState {
  final String error;
  GetCategoryListError(this.error);
}

class GetCategoryListLoading extends CategoryListState {}

class GetCategoryListSuccess extends CategoryListState {
  GetCategoryListSuccess(this.categoryList);
  final CategoryList categoryList;
}
