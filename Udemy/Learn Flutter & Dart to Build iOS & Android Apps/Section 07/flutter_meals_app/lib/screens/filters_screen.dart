import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../widgets/filtered_item.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FilteredItem(),
      drawer: MainDrawer(),
    );
  }
}
