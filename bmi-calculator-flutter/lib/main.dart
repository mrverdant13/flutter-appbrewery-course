import 'package:flutter/material.dart';

import 'package:bmi_calculator/models/bmi_calculator.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/screens/input_page/input_page.dart';
import 'package:bmi_calculator/screens/result_page/result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: kInputPageRoute,
      onGenerateRoute: _routes(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0c23),
        scaffoldBackgroundColor: Color(0xff0a0c23),
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case kInputPageRoute:
          screen = InputPage();
          break;
        case kResultPageRoute:
          screen = ResultPage(
            bmiValue: arguments[bmiValueKey],
            bmiCategory: arguments[bmiCategoryKey],
            bmiInterpretation: arguments[bmiInterpretationKey],
          );
          // screen = Page(arguments['argumentKey']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
