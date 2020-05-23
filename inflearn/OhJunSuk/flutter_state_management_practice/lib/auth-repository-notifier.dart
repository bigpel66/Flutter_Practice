import 'package:flutter/material.dart';

enum AuthStateNotifier {
  Authenticated,
  UnAuthenticated,
}

class AuthRepositoryNotifier with ChangeNotifier {
  AuthStateNotifier rootAuthStateNotifier = AuthStateNotifier.UnAuthenticated;

  setAuthState(AuthStateNotifier authStateNotifier) {
    rootAuthStateNotifier = authStateNotifier;
    notifyListeners();
  }
}
