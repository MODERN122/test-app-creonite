import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExtendedAppBar extends StatelessWidget with PreferredSizeWidget {
  const ExtendedAppBar({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar();
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
