import 'dart:io';
import 'package:flutter/material.dart';
import '../picker/user-image-picker.dart';

class AuthForm extends StatefulWidget {
  final void Function(
    String email,
    String username,
    String password,
    File image,
    bool isLogin,
    BuildContext context,
  ) authCallback;

  AuthForm({this.authCallback});

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  File _userImageFile;

  void _pickedImageHandler(File image) {
    _userImageFile = image;
  }

  void _trySubmit(BuildContext context) {
    final isValid = _formKey.currentState.validate();

    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Image must be selected.'),
          backgroundColor: Theme.of(context).errorColor,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState.save();
      widget.authCallback(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        _userImageFile,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!_isLogin)
                    UserImagePicker(imagePickHandler: _pickedImageHandler),
                  TextFormField(
                    key: ValueKey('emailaddress'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _userEmail = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter Email Address (abc@abc.com)',
                    ),
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters.';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _userName = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Enter User Name',
                      ),
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long.';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _userPassword = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12.0),
                  RaisedButton(
                    onPressed: () {
                      _trySubmit(context);
                    },
                    child: Text(_isLogin ? 'Login' : 'Signup'),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(_isLogin
                        ? 'Create a New Accont'
                        : 'I already Have an Account'),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
