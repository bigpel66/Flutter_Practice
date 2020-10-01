import 'package:flutter/material.dart';
import 'package:provider_practice/models/models.dart';
import 'package:provider_practice/ui/views/views.dart';

class Router {
  static const InitialRoute = 'login';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case 'login':
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case 'post':
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
