import 'package:flutter/material.dart';

import 'package:bmi_calculator/models/bmi_calculator.dart';
import 'package:bmi_calculator/models/gender.dart';

import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/screens/custom-button.dart';
import 'package:bmi_calculator/screens/input_page/gender_card.dart';
import 'package:bmi_calculator/screens/input_page/height_card.dart';
import 'package:bmi_calculator/screens/input_page/int_card.dart';

const int _kMinHeight = 100;
const int _kMaxHeight = 210;
const int _kInitialHeight = ((_kMaxHeight + _kMinHeight) ~/ 2);
const int _kInitialWeight = 40;
const int _kInitialAge = 15;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = _kInitialHeight;
  int weight = _kInitialWeight;
  int age = _kInitialAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _genderRow(),
          ),
          Expanded(
            child: HeightCard(
              height: height,
              minHeight: _kMinHeight,
              maxHeight: _kMaxHeight,
              onChange: (value) {
                setState(() {
                  height = value.round();
                });
              },
            ),
          ),
          Expanded(
            child: _intRow(),
          ),
          CustomButton(
            label: 'CALCULATE YOUR BMI',
            onTap: () {
              BmiCalculator bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              Navigator.pushNamed(
                context,
                kResultPageRoute,
                arguments: {
                  bmiValueKey: bmiCalculator.getValue(),
                  bmiCategoryKey: bmiCalculator.getCategory(),
                  bmiInterpretationKey: bmiCalculator.getInterpretation(),
                },
              );
            },
          )
        ],
      ),
    );
  }

  Widget _genderRow() => Row(
        children: <Widget>[
          Expanded(
            child: GenderCard(
              gender: Gender.male,
              isActive: selectedGender == Gender.male,
              onTap: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
            ),
          ),
          Expanded(
            child: GenderCard(
              gender: Gender.female,
              isActive: selectedGender == Gender.female,
              onTap: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
            ),
          ),
        ],
      );

  Widget _intRow() => Row(
        children: <Widget>[
          Expanded(
            child: IntCard(
              title: 'WEIGHT',
              value: weight,
              onTapMinus: () {
                setState(() {
                  if (weight > 0) weight--;
                });
              },
              onTapPlus: () {
                setState(() {
                  weight++;
                });
              },
            ),
          ),
          Expanded(
            child: IntCard(
              title: 'AGE',
              value: age,
              onTapMinus: () {
                setState(() {
                  if (age > 0) age--;
                });
              },
              onTapPlus: () {
                setState(() {
                  age++;
                });
              },
            ),
          ),
        ],
      );
}
