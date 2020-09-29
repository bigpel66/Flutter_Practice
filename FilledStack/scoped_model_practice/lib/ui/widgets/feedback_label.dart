import 'package:flutter/material.dart';
import 'package:scoped_model_practice/enums/enums.dart';

class FeedbackLabel extends StatelessWidget {
  final int type;

  FeedbackLabel({@required this.type});

  LabelType _getLabelType() {
    switch (type) {
      case 0:
        return LabelType.Bug;
      case 1:
        return LabelType.Request;
      case 2:
        return LabelType.General;
    }

    return LabelType.Bug;
  }

  Color _getLabelColor(LabelType labelType) {
    switch (labelType) {
      case LabelType.Bug:
        return Color.fromARGB(255, 202, 9, 9);
      case LabelType.Request:
        return Color.fromARGB(255, 9, 71, 202);
      case LabelType.General:
        return Color.fromARGB(255, 202, 134, 9);
    }

    return null;
  }

  String _getLabelName() {
    return _getLabelType().toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: _getLabelColor(_getLabelType()),
      ),
      child: Text(_getLabelName()),
    );
  }
}
