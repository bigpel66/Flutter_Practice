import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './login-page.dart';
import './main-page.dart';
import './auth-repository-notifier.dart';
// import './auth-repository.dart';
// import './auth-repository-provider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authRepositoryNotifier = Provider.of<AuthRepositoryNotifier>(context);
    // final authRepository = AuthRepositoryProvider.of(context);

    return authRepositoryNotifier.rootAuthStateNotifier ==
            AuthStateNotifier.Authenticated
        ? MainPage()
        : LoginPage();
    // return StreamBuilder<AuthState>(
    //   stream: authRepository.authStream,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     } else {
    //       if (snapshot.hasData) {
    //         return snapshot.data == AuthState.Authenticated
    //             ? MainPage()
    //             : LoginPage();
    //       } else {
    //         return Text('Error Occured');
    //       }
    //     }
    //   },
    // );
  }
}
