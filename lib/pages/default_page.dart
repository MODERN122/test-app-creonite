import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_creonit/constants.dart';
import 'package:test_creonit/widgets/extended_app_bar.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 55),
      child: Scaffold(
        appBar: ExtendedAppBar(title: "Экран" + widget.title + " в разработке"),
      ),
    );
  }
}
