import 'package:flutter/material.dart';
import './src/login-screen.dart';
import './src/catalog-page.dart';
import './src/cart-page.dart';
import './bloc/cart-bloc-inherited-provider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import './bloc/cart-bloc-package.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: MaterialApp(
        title: 'flutter cart application',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginScreen(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          CatalogPage.routeName: (context) => CatalogPage(),
          CartPage.routeName: (context) => CartPage(),
        },
      ),
    );

    // BlocProvider(
    //   create: (context) => CartBloc(),
    //   child: MaterialApp(
    //     title: 'flutter cart application',
    //     theme: ThemeData(primarySwatch: Colors.blue),
    //     home: LoginScreen(),
    //     routes: {
    //       LoginScreen.routeName: (context) => LoginScreen(),
    //       CatalogPage.routeName: (context) => CatalogPage(),
    //       CartPage.routeName: (context) => CartPage(),
    //     },
    //   ),
    // );
  }
}
