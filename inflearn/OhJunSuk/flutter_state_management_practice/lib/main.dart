import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './root-page.dart';
import './auth-repository-notifier.dart';
// import './auth-repository.dart';
// import './auth-repository-provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthRepositoryNotifier()),
      ],
      child: MaterialApp(
        title: 'state management practice',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: RootPage(),
      ),
    );
    // return AuthRepositoryProvider(
    //   authRepository: AuthRepository(),
    //   child: MaterialApp(
    //     title: 'state management practice',
    //     theme: ThemeData(primarySwatch: Colors.blue),
    //     home: RootPage(),
    //   ),
    // );
  }
}
