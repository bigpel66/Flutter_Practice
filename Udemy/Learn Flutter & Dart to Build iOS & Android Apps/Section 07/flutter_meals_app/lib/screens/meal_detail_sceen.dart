import 'package:flutter/material.dart';
import '../widgets/meal_detail_item.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  final Function isMealFavoritedHandler;
  final Function toggleFavoriteHandler;

  MealDetailScreen({
    @required this.isMealFavoritedHandler,
    @required this.toggleFavoriteHandler,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return mealId == meal.id;
    });

    return Scaffold(
        appBar: AppBar(title: Text(selectedMeal.title)),
        body: MealDetailItem(
          imageUrl: selectedMeal.imageUrl,
          ingredients: selectedMeal.ingredients,
          steps: selectedMeal.steps,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            isMealFavoritedHandler(mealId) ? Icons.star : Icons.star_border,
          ),
          onPressed: () => toggleFavoriteHandler(mealId),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
