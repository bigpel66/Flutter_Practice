import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _buildAppBar() {
    return AppBar(
      title: const Text('DeliMeals'),
    );
  }

  Widget _buildCupertinoNavigationBar() {
    return CupertinoNavigationBar(
      middle: const Text('DeliMeals'),
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

  Widget _buildMaterialApp(PreferredSizeWidget appBar) {
    return MaterialApp(
      title: 'Practice with Udemy',
      home: _buildScaffold(appBar),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // routes: {
      //   '': ,
      //   '': ,
      // },
    );
  }

  Widget _buildCupertinoApp(PreferredSizeWidget appBar) {
    return CupertinoApp(
      title: 'Practice with Udemy',
      home: _buildCupertinoPageScaffold(appBar),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final PreferredSizeWidget appBar =
    //     Platform.isIOS ? _buildCupertinoNavigationBar() : _buildAppBar();

    final PreferredSizeWidget appBar = _buildAppBar();

    // return Platform.isIOS ? _buildCupertinoApp(appBar) : _buildMaterialApp(appBar);

    return _buildMaterialApp(appBar);
  }
}
