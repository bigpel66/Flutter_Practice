import 'package:flutter/material.dart';
import 'package:scoped_model_practice/ui/shared/app_colors.dart';

class IndicatorButton extends StatelessWidget {
  final String title;
  final double height;
  final int indicationCount;
  final Function onTap;

  IndicatorButton({
    this.title,
    this.height = 50.0,
    this.indicationCount,
    this.onTap,
  });

  bool get hasIndication => indicationCount != null && indicationCount > 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: primaryColor,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            hasIndication
                ? Positioned(
                    top: 10.0,
                    right: 20.0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 30.0,
                      height: 30.0,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: darkGrey,
                      ),
                      child: Text(
                        indicationCount.toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
