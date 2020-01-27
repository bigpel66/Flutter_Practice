import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String title;

  IconContent({
    @required this.iconData,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
