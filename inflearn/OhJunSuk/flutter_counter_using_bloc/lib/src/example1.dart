import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

int counter = 0;

class Example1 extends StatelessWidget {
  static const routeName = '/example/1';

  final counterSubject = BehaviorSubject<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
                stream: counterSubject.stream,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                      style: TextStyle(fontSize: 30.0),
                    );
                  } else {
                    return Text('Error Occured');
                  }
                }),
            RaisedButton(
              child: Text('Count'),
              onPressed: () {
                counterSubject.add(++counter);
              },
            ),
          ],
        ),
      ),
    );
  }
}
