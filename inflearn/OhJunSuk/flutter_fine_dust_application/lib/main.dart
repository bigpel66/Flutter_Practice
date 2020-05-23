import 'package:flutter/material.dart';
import './fine-dust.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter-find-dust',
      home: FineDust(),
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        FineDust.routeName: (context) => FineDust(),
      },
    );
  }
}
