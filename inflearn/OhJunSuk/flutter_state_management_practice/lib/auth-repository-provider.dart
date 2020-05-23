import 'package:flutter/material.dart';
import 'auth-repository.dart';

class AuthRepositoryProvider extends InheritedWidget {
  final AuthRepository authRepository;

  AuthRepositoryProvider({Key key, AuthRepository authRepository, Widget child})
      : authRepository = authRepository ?? AuthRepository(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AuthRepository of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<AuthRepositoryProvider>())
        .authRepository;
  }
}
