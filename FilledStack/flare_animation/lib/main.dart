import 'package:flutter/material.dart';
import 'flare_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flare animation',
      home: FlareDemo(),
    );
  }
}
