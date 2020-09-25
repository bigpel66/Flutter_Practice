import 'package:flutter/material.dart';

class MealDetailItem extends StatelessWidget {
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  MealDetailItem({
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
  });

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 400,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          _buildSectionTitle(context, 'Ingredients'),
          _buildContainer(
            ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(ingredients[index]),
                  ),
                  elevation: 2,
                );
              },
            ),
          ),
          _buildSectionTitle(context, 'Steps'),
          _buildContainer(
            ListView.builder(
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(steps[index]),
                    ),
                    Divider(thickness: 1),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
