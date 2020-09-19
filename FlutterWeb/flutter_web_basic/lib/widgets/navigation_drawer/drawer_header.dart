import 'package:flutter/material.dart';
import 'package:flutter_web_basic/constants/app_colors.dart';
import 'package:flutter_web_basic/locator.dart';
import 'package:flutter_web_basic/routings/route_names.dart';
import 'package:flutter_web_basic/services/navigation_service.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: primaryColor,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
          // SERVICE SHOULD ONLY BE USED FROM A VIEWMODEL
          locator<NavigationService>().navigateTo(HomeRoute);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'SKILL UP NOW',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              'TAP HERE',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
