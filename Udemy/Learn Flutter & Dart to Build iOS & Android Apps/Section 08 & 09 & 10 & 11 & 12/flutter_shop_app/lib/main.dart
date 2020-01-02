import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _buildMaterialApp() {
    return MaterialApp(
      title: 'Practice with Udemy',
      initialRoute: '/',
      routes: {
        '/': (context) => ProductsOverviewScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => ProductsOverviewScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => ProductsOverviewScreen());
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        // textTheme: ThemeData.light().textTheme.copyWith(
        //   body1: ,
        //   body2: ,
        //   title: ,
        // ),
        // fontFamily: ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp();
  }
}
