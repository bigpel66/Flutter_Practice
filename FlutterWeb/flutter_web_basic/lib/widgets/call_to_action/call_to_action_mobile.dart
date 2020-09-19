import 'package:flutter/material.dart';
import 'package:flutter_web_basic/constants/app_colors.dart';

class CallToActionMobile extends StatelessWidget {
  final String title;
  const CallToActionMobile(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
