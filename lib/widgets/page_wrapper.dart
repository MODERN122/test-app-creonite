import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_creonit/constants.dart';
import 'package:test_creonit/pages/catalog_page.dart';
import 'package:test_creonit/pages/default_page.dart';

class PagesWrapper extends StatefulWidget {
  const PagesWrapper({this.initPageIndex, this.innerPage});

  final int? initPageIndex;
  final Widget? innerPage;

  @override
  _PagesWrapperState createState() => _PagesWrapperState();
}

class _PagesWrapperState extends State<PagesWrapper> {
  late int? _currentPageIndex;
  late Widget? _innerPage;
  bool _showBottomNav = true;

  @override
  void initState() {
    super.initState();
    _innerPage = widget.innerPage;
    _currentPageIndex = widget.initPageIndex;
  }

  final List<_Page> bottomMenupages = [
    _Page(
      DefaultPage(title: "Главная"),
      Constants.iconsPath + "home.png",
      'Главная',
    ),
    const _Page(
      CatalogPage(),
      Constants.iconsPath + "catalog.png",
      'Каталог',
    ),
    _Page(DefaultPage(title: 'Избранное'), Constants.iconsPath + "heart.png",
        'Избранное'),
    _Page(
      DefaultPage(title: 'Корзина'),
      Constants.iconsPath + "cart.png",
      'Корзина',
    ),
    _Page(
      DefaultPage(title: 'Профиль'),
      Constants.iconsPath + "profile.png",
      'Профиль',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget body = Center(
      child: Text('Произошла ошибка'),
    );

    if (_innerPage != null) {
      body = widget.innerPage!;
    } else if (_currentPageIndex != null) {
      body = bottomMenupages[_currentPageIndex!].page;
      _showBottomNav = bottomMenupages[_currentPageIndex!].showBottomNav;
    }

    return Scaffold(
      body: body,
      extendBody: _showBottomNav,
      bottomNavigationBar: _showBottomNav
          ? Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 55,
                ),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: bottomMenupages
                        .asMap()
                        .map(
                          (key, value) => MapEntry(key, _buildBtn(key, value)),
                        )
                        .values
                        .toList()),
              ],
            )
          : null,
    );
  }

  Widget _buildBtn(int key, _Page page) {
    return Expanded(
      child: InkWell(
        onTap: () => setState(() {
          _currentPageIndex = key;
          _innerPage = null;
        }),
        child: SizedBox(
          height: 55,
          child: Column(
            children: [
              Image.asset(
                page.assetIcon,
                color: key == _currentPageIndex
                    ? const Color(0xFF414951)
                    : const Color(0x8F8A8884),
              ),
              Text(
                page.label,
                style: TextStyle(
                  fontSize: 10,
                  color: key == _currentPageIndex
                      ? const Color(0xFF414951)
                      : const Color(0x8F8A8884),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Page {
  const _Page(this.page, this.assetIcon, this.label,
      [this.showBottomNav = true]);

  final Widget page;
  final String assetIcon;
  final String label;
  final bool showBottomNav;
}
