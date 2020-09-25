import 'package:flutter/material.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/nav_bar_item.dart';
import 'package:flutter_web_basic/locator.dart';
import 'package:flutter_web_basic/services/navigation_service.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String navigationPath;
  const DrawerItem(this.title, this.icon, this.navigationPath, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 30),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
              // SERVICE SHOULD ONLY BE USED FROM A VIEWMODEL
              locator<NavigationService>().navigateTo(navigationPath);
            },
            child: NavBarItem(title),
          ),
        ],
      ),
    );
  }
}
