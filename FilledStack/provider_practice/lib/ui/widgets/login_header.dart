import 'package:flutter/material.dart';
import 'package:provider_practice/ui/shared/shared.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controller;

  LoginHeader({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Login', style: headerStyle),
        UIHelper.verticalSpaceMedium(),
        Text('Enter a number betwee 1 - 10', style: subHeaderStyle),
        LoginTextField(controller: controller),
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;

  LoginTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration.collapsed(hintText: 'User Id'),
      ),
    );
  }
}
