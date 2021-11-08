import 'package:flutter/material.dart';
import 'package:test_creonit/blocs/product_list/product_list_view.dart';
import 'package:test_creonit/constants.dart';
import 'package:test_creonit/models/category.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({required this.category, Key? key}) : super(key: key);
  final Category category;

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 55),
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Image.asset(Constants.iconsPath + "search.png"),
                tooltip: 'Поиск',
                onPressed: () {
                  // handle the press
                },
              ),
            ],
            title: Center(
              child: Text(widget.category.title),
            ),
            leadingWidth: 47,
            leading: GestureDetector(
              child: Image.asset(Constants.iconsPath + "arrow_left.png"),
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, right: 8),
                                  child: Image.asset(
                                      Constants.iconsPath + "filter.png"),
                                ),
                                const Center(
                                    child: Text(
                                  "Фильтры",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: VerticalDivider(
                            width: 1,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, right: 8),
                                  child: Image.asset(
                                      Constants.iconsPath + "sorting.png"),
                                ),
                                const Center(
                                  child: Text(
                                    "По популярности",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 42),
                child: ProductListView(
                  category: widget.category,
                ),
              ),
            ],
          )),
    );
  }
}
