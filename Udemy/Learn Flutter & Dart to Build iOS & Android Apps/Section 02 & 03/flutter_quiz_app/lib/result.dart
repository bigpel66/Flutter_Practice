import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result({@required this.resultScore, @required this.resetHandler});

  String get resultPhrase {
    String resultText = 'You did it!\n';

    if (resultScore <= 8) {
      resultText += 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText += 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText += 'You are ... strange?!';
    } else {
      resultText += 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            textColor: Colors.blue,
            child: Text('Restart Quiz!'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
