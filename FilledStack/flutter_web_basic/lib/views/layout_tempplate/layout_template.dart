import 'package:flutter/material.dart';
import 'package:flutter_web_basic/locator.dart';
import 'package:flutter_web_basic/routings/route_names.dart';
import 'package:flutter_web_basic/routings/router.dart';
import 'package:flutter_web_basic/services/navigation_service.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_web_basic/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_web_basic/widgets/centered_view/centered_view.dart';
import 'package:flutter_web_basic/widgets/navigation_bar/navigation_bar.dart';

class LayoutTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: HomeRoute,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
