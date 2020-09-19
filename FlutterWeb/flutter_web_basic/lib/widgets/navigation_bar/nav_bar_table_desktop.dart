import 'package:flutter/material.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/nav_bar_item.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/nav_bar_logo.dart';

class NavBarTableDesktop extends StatelessWidget {
  const NavBarTableDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Episodes'),
              SizedBox(width: 60),
              NavBarItem('About'),
            ],
          )
        ],
      ),
    );
  }
}
