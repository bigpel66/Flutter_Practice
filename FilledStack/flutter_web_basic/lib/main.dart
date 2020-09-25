import 'package:flutter/material.dart';
import 'package:flutter_web_basic/locator.dart';
import 'package:flutter_web_basic/views/layout_tempplate/layout_template.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Basic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: LayoutTemplate(),
    );
  }
}
