import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _buildMaterialApp() {
    return MaterialApp(
      title: 'Practice with Udemy',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: {
      //   '': ,
      //   '': ,
      // },
    );
  }

  Widget _buildCupertinoApp() {
    return CupertinoApp(
      title: 'Practice with Udemy',
      home: MyHomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Platform.isIOS ? _buildCupertinoApp() : _buildMaterialApp();

    return _buildMaterialApp();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildAppBar() {
    return AppBar(
      title: Text('DeliMeals'),
    );
  }

  Widget _buildCupertinoNavigationBar() {
    return CupertinoNavigationBar(
      middle: Text('DeliMeals'),
    );
  }

  Widget _buildScaffold(PreferredSizeWidget appBar) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: CategoriesScreen(),
      ),
    );
  }

  Widget _buildCupertinoPageScaffold(PreferredSizeWidget appBar) {
    return CupertinoPageScaffold(
      navigationBar: appBar,
      child: Center(
        child: Text('Navigation Time'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar =
        Platform.isIOS ? _buildCupertinoNavigationBar() : _buildAppBar();

    final mediaQuery = MediaQuery.of(context);

    // return Platform.isIOS
    //     ? _buildCupertinoPageScaffold(appBar)
    //     : _buildScaffold(appBar);

    return _buildScaffold(appBar);
  }
}
