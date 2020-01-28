import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTapHandler;
  final String buttonTitle;

  BottomButton({@required this.onTapHandler, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
        decoration: BoxDecoration(
          color: bottomContainerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(buttonTitle, style: buttonTextStyle),
        ),
      ),
    );
  }
}
