import 'dart:async';
import 'package:rxdart/rxdart.dart';
import './validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get email => _emailController.stream.transform(
        validateEmail,
      );
  Stream<String> get password => _passwordController.stream.transform(
        validatePassword,
      );

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) {
        return true;
      });

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
