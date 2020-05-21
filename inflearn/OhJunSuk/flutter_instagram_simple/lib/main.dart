import 'package:flutter/material.dart';
import './root-page.dart';
import './create-page.dart';
import './detail-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram Simple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      home: RootPage(),
      routes: {
        CreatePage.routeName: (context) => CreatePage(),
        DetailPage.routeName: (context) => DetailPage(),
      },
    );
  }
}
