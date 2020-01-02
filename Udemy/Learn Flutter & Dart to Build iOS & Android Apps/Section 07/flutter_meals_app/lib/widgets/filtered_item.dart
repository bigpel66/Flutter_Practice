import 'package:flutter/material.dart';

class FilteredItem extends StatefulWidget {
  @override
  _FilteredItemState createState() => _FilteredItemState();
}

class _FilteredItemState extends State<FilteredItem> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    bool value,
    Function updateHandler,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (_) => updateHandler(_),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust Your Meal Selection!',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                'Gluten-Free',
                'Only Include Gluten-Free Meals',
                _glutenFree,
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Lactose-Free',
                'Only Include Lactose-Free Meals',
                _lactoseFree,
                (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegeterian',
                'Only Include Vegeterian Meals',
                _vegetarian,
                (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only Include Vegan Meals',
                _vegan,
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
