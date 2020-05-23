import 'package:flutter/material.dart';
import './catalog-page.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CatalogPage.routeName);
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
