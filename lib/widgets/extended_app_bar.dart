import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_creonit/constants.dart';

class ExtendedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExtendedAppBar({
    Key? key,
    required this.title,
    this.hasSearch = false,
  }) : super(key: key);

  final String title;
  final bool hasSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        if (hasSearch)
          IconButton(
            icon: SvgPicture.asset(Constants.iconsPath + "search.svg"),
            tooltip: 'Поиск',
            onPressed: () {
              // handle the press
            },
          ),
      ],
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(title),
        ),
      ),
      leadingWidth: 47,
      leading: IconButton(
        icon: SvgPicture.asset(Constants.iconsPath + "arrow_left.svg"),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
