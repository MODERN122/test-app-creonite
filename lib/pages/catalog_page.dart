import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_creonit/blocs/category_list/category_list_view.dart';
import 'package:test_creonit/constants.dart';
import 'package:test_creonit/widgets/extended_app_bar.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 55),
      child: Scaffold(
        appBar: ExtendedAppBar(
          title: "Для лица",
        ),
        body: Column(children: const [
          Divider(
            height: 1,
          ),
          CategoryListView(),
        ]),
      ),
    );
  }
}
