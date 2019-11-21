import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/models/current_weather.dart';
import 'package:clima/routes.dart';
import 'package:clima/screens/location_screen/location_screen.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Location().getCurrentLocation().then((_) {
      CurrentWeather.getByCoords(
        latitude: Location().latitude,
        longitude: Location().longitude,
      ).then((currentWeather) {
        Navigator.pushReplacementNamed(
          context,
          kLocationScreenRoute,
          arguments: {
            kLocationScreenFirstParameterKey: currentWeather,
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: MediaQuery.of(context).size.shortestSide * 0.75,
        ),
      ),
    );
  }
}
