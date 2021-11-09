import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_creonit/blocs/category_list/bloc/category_list_bloc.dart';
import 'package:test_creonit/constants.dart';
import 'package:test_creonit/pages/products_page.dart';
import 'package:test_creonit/widgets/page_wrapper.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  late CategoryListBloc categoryListBloc;
  @override
  void initState() {
    categoryListBloc = context.read<CategoryListBloc>();
    categoryListBloc.add(GetCategoryList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryListBloc, CategoryListState>(
      bloc: categoryListBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetCategoryListSuccess) {
          var categories = state.categoryList.items;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, i) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PagesWrapper(
                              innerPage: ProductsPage(category: categories[i])),
                        ),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 9, bottom: 7),
                              child: Row(
                                children: [
                                  Text(
                                    categories[i].title,
                                    style: const TextStyle(
                                      color: Color(0xFF414951),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                 const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7),
                                    child: Image.asset(Constants.iconsPath +
                                        "arrow_right.png"),
                                  )
                                ],
                              ),
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                    ),
                itemCount: categories.length),
          );
        } else if (state is GetCategoryListError) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is GetCategoryListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: Text("Непредвиденная ошибка"),
        );
      },
    );
  }
}
