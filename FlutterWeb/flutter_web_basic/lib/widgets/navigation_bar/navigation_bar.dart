import 'package:flutter/material.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/nav_bar_mobile.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/nav_bar_table_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavBarMobile(),
      tablet: NavBarTableDesktop(),
    );
  }
}
