import 'package:flutter/material.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/ui/views/views.dart';

class RoutePath {
  static const String Login = 'login';
  static const String Home = '/';
  static const String Post = 'post';
}

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.Home:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case RoutePath.Login:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case RoutePath.Post:
        Post post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (_) => PostView(post: post),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Not Found 404 with ${settings.name}'),
            ),
          ),
        );
    }
  }
}
