import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './auth-repository-notifier.dart';
// import './auth-repository.dart';
// import './auth-repository-provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authRepoitoryNotifier = Provider.of<AuthRepositoryNotifier>(context);
    // final authRepository = AuthRepositoryProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            authRepoitoryNotifier
                .setAuthState(AuthStateNotifier.UnAuthenticated);
            // authRepository.setAuthState(AuthState.UnAuthenticated);
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
