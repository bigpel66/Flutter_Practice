import 'package:flutter/material.dart';
import 'package:flutter_web_basic/routings/route_names.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/nav_bar_item.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/nav_bar_logo.dart';
import 'package:flutter_web_basic/locator.dart';
import 'package:flutter_web_basic/services/navigation_service.dart';

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
              GestureDetector(
                onTap: () {
                  // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
                  // SERVICE SHOULD ONLY BE USED FROM A VIEWMODEL
                  locator<NavigationService>().navigateTo(EpisodesRoute);
                },
                child: NavBarItem('Episodes'),
              ),
              SizedBox(width: 60),
              GestureDetector(
                onTap: () {
                  // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
                  // SERVICE SHOULD ONLY BE USED FROM A VIEWMODEL
                  locator<NavigationService>().navigateTo(AboutRoute);
                },
                child: NavBarItem('About'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
