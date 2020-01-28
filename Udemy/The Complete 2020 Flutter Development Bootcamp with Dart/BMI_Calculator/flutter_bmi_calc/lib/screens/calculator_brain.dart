import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  final double height;
  final double weight;

  CalculatorBrain({
    @required this.height,
    @required this.weight,
  });

  double get _bmi => weight / pow(height / 100, 2);

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getDescription() {
    if (_bmi >= 25.0) {
      return 'You have a higher than normal body weight.\n Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.\n Good job!';
    } else {
      return 'You have a lower than normal body weight.\n You can eat a bit more.';
    }
  }
}
