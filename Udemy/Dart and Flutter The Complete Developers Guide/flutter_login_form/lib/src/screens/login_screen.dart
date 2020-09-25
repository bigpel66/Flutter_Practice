import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final _form = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: (value) => validateEmail(value),
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Enter Password',
          hintText: 'Password',
        ),
        validator: (value) => validatePassword(value),
        onSaved: (String value) {
          password = value;
        },
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        if (_form.currentState.validate()) {
          _form.currentState.save();
        }
      },
      color: Colors.blue,
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            SizedBox(height: 25),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
