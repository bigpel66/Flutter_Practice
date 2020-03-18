import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  Widget buildContainer() {
    return Container(
      color: Colors.grey[200],
      height: 24.0,
      width: 150.0,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: buildContainer(),
          subtitle: buildContainer(),
        ),
        Divider(height: 8.0),
      ],
    );
  }
}
