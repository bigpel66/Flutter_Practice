import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  const NavBarItem(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
