import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_creonit/models/category.dart';
import 'package:test_creonit/repositories/categories_repository.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc({required CategoriesRepository categoriesRepository})
      : super(CategoryListInitial()) {
    on<GetCategoryList>((event, emit) async {
      try {
        emit(GetCategoryListLoading());
        var categories = await categoriesRepository.fetchCategories();
        emit(GetCategoryListSuccess(categories));
      } catch (e) {
        emit(GetCategoryListError(e.toString()));
      }
    });
  }
}
