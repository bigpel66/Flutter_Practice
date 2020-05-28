import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './loading-page.dart';
import './login-page.dart';
import './tab-page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _handleCurrentScreen();
  }

  Widget _handleCurrentScreen() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            if (snapshot.hasData) {
              return TabPage(currentUser: snapshot.data);
            } else {
              return LoginPage();
            }
          }
        });
  }
}
