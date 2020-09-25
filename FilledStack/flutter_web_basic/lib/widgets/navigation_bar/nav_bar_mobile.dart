import 'package:flutter/material.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/nav_bar_logo.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          NavBarLogo(),
        ],
      ),
    );
  }
}
