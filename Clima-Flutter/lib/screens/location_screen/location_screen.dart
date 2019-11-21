import 'package:clima/routes.dart';
import 'package:flutter/material.dart';

import 'package:clima/models/current_weather.dart';
// import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';

const String kLocationScreenFirstParameterKey = 'CurrentWeather';

class LocationScreen extends StatefulWidget {
  final CurrentWeather currentWeather;

  LocationScreen({@required this.currentWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  CurrentWeather currentWeather;

  @override
  void initState() {
    super.initState();
    currentWeather = widget.currentWeather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(
            // height: MediaQuery.of(context).size.height,
            ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        kLoadingScreenRoute,
                      );
                      // setState(() async {
                      //   await Location().getCurrentLocation();
                      //   currentWeather = await CurrentWeather.getByCoords(
                      //     latitude: Location().latitude,
                      //     longitude: Location().longitude,
                      //   );
                      // });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      // Navigator.pushNamed(
                      //   context,
                      //   kCityScreenRoute,
                      // );
                      final returnedCurrentWeather =
                          await Navigator.pushNamed(
                        context,
                        kCityScreenRoute,
                      );
                      if (returnedCurrentWeather != null) {
                        setState(() {
                          currentWeather = returnedCurrentWeather;
                        });
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${currentWeather.main.temp.toInt()}°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      CurrentWeather.getWeatherIcon(
                          currentWeather.weather[0].id),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "${CurrentWeather.getMessage(currentWeather.main.temp.toInt())} in ${currentWeather.name}",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
