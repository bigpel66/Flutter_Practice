import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/services/services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) => locator<AuthenticationService>().user,
      child: MaterialApp(
        title: 'proivder practice',
        theme: ThemeData(),
        initialRoute: Router.InitialRoute,
        onGenerateRoute: Router.onGenerateRoute,
      ),
    );
  }
}
