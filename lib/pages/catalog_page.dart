import 'package:flutter/material.dart';
import 'package:test_creonit/blocs/category_list/category_list_view.dart';
import 'package:test_creonit/constants.dart';

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
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(Constants.iconsPath + "arrow_left.png")),
            title: Stack(children: [
              Center(child: Text("Для лица")),
            ])),
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
