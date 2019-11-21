import 'dart:math';

import 'package:flutter/material.dart';

const String bmiValueKey = 'bmiValue';
const String bmiCategoryKey = 'bmiCategory';
const String bmiInterpretationKey = 'bmiInterpretation';

class BmiCalculator {
  final int height;
  final int weight;
  double _bmi;

  BmiCalculator({
    @required this.height,
    @required this.weight,
  });

  String getValue() {
    this._bmi = this.weight / pow(this.height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getCategory() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
