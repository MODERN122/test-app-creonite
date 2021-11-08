import 'package:flutter/material.dart';
import 'package:test_creonit/constants.dart';

class DefaultPage extends StatefulWidget {
  DefaultPage({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(Constants.iconsPath + "arrow_left.png")),
      ),
      body: Center(
        child: Text(widget.title + " в разработке"),
      ),
    );
  }
}
