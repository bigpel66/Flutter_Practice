import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter Email Address (abc@abc.com)',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      hintText: 'Enter User Name',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12.0),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Create a New Accont'),
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
