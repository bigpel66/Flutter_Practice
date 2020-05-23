import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './auth-repository-notifier.dart';
// import './auth-repository.dart';
// import './auth-repository-provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authRepositoryNotifier = Provider.of<AuthRepositoryNotifier>(context);
    // final authRepository = AuthRepositoryProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            authRepositoryNotifier
                .setAuthState(AuthStateNotifier.Authenticated);
            // authRepository.setAuthState(AuthState.Authenticated);
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
