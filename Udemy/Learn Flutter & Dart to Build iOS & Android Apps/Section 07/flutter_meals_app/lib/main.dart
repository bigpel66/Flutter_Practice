// import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_sceen.dart';
import './widgets/main_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Widget _buildCupertinoApp() {
  //   return CupertinoApp(
  //     title: 'Practice with Udemy',
  //     home: CategoriesScreen(),
  //   );
  // }

  Widget _buildMaterialApp() {
    return MaterialApp(
      title: 'Practice with Udemy',
      // home: CategoriesScreen(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: const TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (contetxt) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Platform.isIOS ? _buildCupertinoApp(appBar) : _buildMaterialApp(appBar);

    return _buildMaterialApp();
  }
}
