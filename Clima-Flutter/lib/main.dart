import 'package:flutter/material.dart';

import 'package:clima/routes.dart';
import 'package:clima/screens/city_screen/city_screen.dart';
import 'package:clima/screens/loading_screen/loading_screen.dart';
import 'package:clima/screens/location_screen/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: kLoadingScreenRoute,
      onGenerateRoute: _routes(),
      theme: ThemeData.dark(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case kCityScreenRoute:
          screen = CityScreen();
          break;
        case kLoadingScreenRoute:
          screen = LoadingScreen();
          // screen = Page(arguments['argumentKey']);
          break;
        case kLocationScreenRoute:
          screen = LocationScreen(
            currentWeather: arguments[kLocationScreenFirstParameterKey],
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
