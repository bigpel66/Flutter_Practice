import 'package:flutter/material.dart';
import 'package:flutter_web_basic/routings/route_names.dart';
import 'package:flutter_web_basic/views/about/about_view.dart';
import 'package:flutter_web_basic/views/episodes/episodes_view.dart';
import 'package:flutter_web_basic/views/home/home_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView());
    case AboutRoute:
      return _getPageRoute(AboutView());
    case EpisodesRoute:
      return _getPageRoute(EpisodesView());
  }
  return null;
}

PageRoute _getPageRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (
      BuildContext contxet,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        child,
    transitionsBuilder: (
      BuildContext contxet,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
