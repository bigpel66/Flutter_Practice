import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mealId = routeArgs['id'];
    final mealTitle = routeArgs['title'];

    print(mealId);

    return Scaffold(
      appBar: AppBar(title: Text(mealTitle)),
      body: Center(child: Container()),
    );
  }
}
