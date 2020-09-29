import 'package:flutter/material.dart';
import 'package:scoped_model_practice/ui/shared/shared.dart';

class StatsCounter extends StatelessWidget {
  final String title;
  final Color titleColor;
  final double size;
  final int count;

  StatsCounter({
    @required this.title,
    this.titleColor = Colors.white,
    @required this.size,
    @required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: darkGrey,
      ),
      child: Column(
        children: <Widget>[
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: size * 0.6,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: size * 0.1,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
