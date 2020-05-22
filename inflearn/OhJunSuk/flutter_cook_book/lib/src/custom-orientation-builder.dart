import 'package:flutter/material.dart';

class CustomOrientationBuilder extends StatefulWidget {
  static const routeName = '/custom-orientation-builder';

  _CustomOrientaionBuilderState createState() =>
      _CustomOrientaionBuilderState();
}

class _CustomOrientaionBuilderState extends State<CustomOrientationBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Builder'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            children: List.generate(50, (position) {
              return Center(child: Text('$position Item'));
            }),
          );
        },
      ),
    );
  }
}
