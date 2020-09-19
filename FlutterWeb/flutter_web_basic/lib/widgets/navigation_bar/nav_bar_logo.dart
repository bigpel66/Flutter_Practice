import 'package:flutter/material.dart';
import 'package:flutter_web_basic/locator.dart';
import 'package:flutter_web_basic/routings/route_names.dart';
import 'package:flutter_web_basic/services/navigation_service.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: GestureDetector(
        onTap: () {
          locator<NavigationService>().navigateTo(HomeRoute);
        },
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
