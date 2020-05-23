import 'package:flutter/material.dart';
import './src/example1.dart';
import './src/example2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc pattern practice',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
      routes: {
        Example1.routeName: (context) => Example1(),
        Example2.routeName: (context) => Example2(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Examples')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Example1.routeName);
              },
              child: Text('Example 1'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Example2.routeName);
              },
              child: Text('Example 2'),
            ),
          ],
        ),
      ),
    );
  }
}
