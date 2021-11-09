import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_creonit/blocs/category_list/bloc/category_list_bloc.dart';
import 'package:test_creonit/repositories/categories_repository.dart';
import 'package:test_creonit/widgets/page_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CategoriesRepository categoriesRepository = CategoriesRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryListBloc>(
          create: (BuildContext context) => CategoryListBloc(
            categoriesRepository: categoriesRepository,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Test App for Creonit',
        theme: ThemeData(
            fontFamily: "OpenSans",
            canvasColor: Colors.white,
            backgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              shadowColor: Colors.transparent,
              color: Colors.white,
              titleTextStyle: TextStyle(
                color: Color(0xFF414951),
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
              iconTheme: IconThemeData(
                color: Color(0xFF414951),
              ),
              actionsIconTheme: IconThemeData(color: Color(0xFF130F26)),
            )),
        home:const PagesWrapper(
          initPageIndex: 1,
        ),
      ),
    );
  }
}
