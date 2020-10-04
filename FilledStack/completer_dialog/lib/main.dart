import 'package:flutter/material.dart';
import 'package:completer_dialog/locator.dart';
import 'package:completer_dialog/views/views.dart';
import 'package:completer_dialog/managers/managers.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'completer_dialog',
      builder: (BuildContext context, Widget child) {
        return Navigator(
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return DialogManager(
                  child: child,
                );
              },
            );
          },
        );
      },
      home: HomeView(),
    );
  }
}
