import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './login-page.dart';
import './tab-page.dart';
import './loading-page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          if (snapshot.hasData) {
            return TabPage(userInfo: snapshot.data);
          } else {
            return LoginPage();
          }
        }
      },
    );
  }
}
