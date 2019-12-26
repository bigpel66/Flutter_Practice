import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String showedText;

  TextOutput({@required this.showedText});

  @override
  Widget build(BuildContext context) {
    return Text(
      showedText,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
