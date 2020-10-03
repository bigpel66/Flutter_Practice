import 'package:flutter/material.dart';
import 'sequence_animation_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sequence animation',
      home: SequenceAnimationView(),
    );
  }
}
