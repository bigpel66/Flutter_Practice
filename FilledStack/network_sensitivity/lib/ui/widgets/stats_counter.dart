import 'package:flutter/material.dart';
import 'package:network_sensitivity/ui/shared/shared.dart';

class StatsCounter extends StatelessWidget {
  final double size;
  final int count;
  final String title;
  final Color titleColor;

  StatsCounter({
    @required this.size,
    @required this.count,
    @required this.title,
    this.titleColor = Colors.white,
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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
              fontSize: size * 0.1,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
