import 'package:flutter/material.dart';
import './textOutput.dart';

class TextControl extends StatefulWidget {
  @override
  State createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  var textGiven = [
    {'text': '1st Text'},
    {'text': '2nd Text'},
    {'text': '3rd Text'},
  ];

  int _textIndex = 0;

  void _changeText() {
    setState(() {
      _textIndex = (_textIndex + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          TextOutput(showedText: textGiven[_textIndex]['text']),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Click to change the Text!'),
            onPressed: () => _changeText(),
          ),
        ],
      ),
    );
  }
}
