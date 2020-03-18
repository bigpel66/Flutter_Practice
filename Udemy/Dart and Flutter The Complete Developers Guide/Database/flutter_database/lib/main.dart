import 'package:flutter/material.dart';
import './src/screens/news_list.dart';
import './src/screens/news_detail.dart';
import './src/blocs/stories_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!!',
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            return NewsList();
          });
        },
      ),
    );
  }
}
