import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_setup.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/services/services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'proivder practice',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: RoutePath.Login,
        onGenerateRoute: Router.onGenerateRoute,
      ),
    );
  }
}
