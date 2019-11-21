import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

const String _kApiKey = '96322f05f2623c8c027b0f53fbb1a7c5';

class CurrentWeather {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int id;
  String name;
  int cod;

  CurrentWeather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });

  CurrentWeather copyWith({
    Coord coord,
    List<Weather> weather,
    String base,
    Main main,
    Wind wind,
    Clouds clouds,
    int dt,
    Sys sys,
    int id,
    String name,
    int cod,
  }) =>
      CurrentWeather(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        base: base ?? this.base,
        main: main ?? this.main,
        wind: wind ?? this.wind,
        clouds: clouds ?? this.clouds,
        dt: dt ?? this.dt,
        sys: sys ?? this.sys,
        id: id ?? this.id,
        name: name ?? this.name,
        cod: cod ?? this.cod,
      );

  factory CurrentWeather.fromRawJson(String str) =>
      CurrentWeather.fromJson(json.decode(str));

  static Future<CurrentWeather> getByCoords(
      {@required double latitude, @required double longitude}) async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$_kApiKey&units=metric');
    if (response.statusCode == 200) {
      return CurrentWeather.fromRawJson(response.body);
    }
    return null;
  }

  static Future<CurrentWeather> getByCityName(String cityName) async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_kApiKey&units=metric');
    if (response.statusCode == 200) {
      return CurrentWeather.fromRawJson(response.body);
    }
    return null;
  }

  String toRawJson() => json.encode(toJson());

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"] == null ? null : json["base"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        dt: json["dt"] == null ? null : json["dt"],
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        cod: json["cod"] == null ? null : json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord == null ? null : coord.toJson(),
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base == null ? null : base,
        "main": main == null ? null : main.toJson(),
        "wind": wind == null ? null : wind.toJson(),
        "clouds": clouds == null ? null : clouds.toJson(),
        "dt": dt == null ? null : dt,
        "sys": sys == null ? null : sys.toJson(),
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "cod": cod == null ? null : cod,
      };

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

class Clouds {
  int all;

  Clouds({
    this.all,
  });

  Clouds copyWith({
    int all,
  }) =>
      Clouds(
        all: all ?? this.all,
      );

  factory Clouds.fromRawJson(String str) => Clouds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] == null ? null : json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all == null ? null : all,
      };
}

class Coord {
  double lon;
  double lat;

  Coord({
    this.lon,
    this.lat,
  });

  Coord copyWith({
    double lon,
    double lat,
  }) =>
      Coord(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
      );

  factory Coord.fromRawJson(String str) => Coord.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon == null ? null : lon,
        "lat": lat == null ? null : lat,
      };
}

class Main {
  double temp;
  double pressure;
  int humidity;
  double tempMin;
  double tempMax;
  double seaLevel;
  double grndLevel;

  Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
    this.seaLevel,
    this.grndLevel,
  });

  Main copyWith({
    double temp,
    double pressure,
    int humidity,
    double tempMin,
    double tempMax,
    double seaLevel,
    double grndLevel,
  }) =>
      Main(
        temp: temp ?? this.temp,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        seaLevel: seaLevel ?? this.seaLevel,
        grndLevel: grndLevel ?? this.grndLevel,
      );

  factory Main.fromRawJson(String str) => Main.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"].toDouble(),
        humidity: json["humidity"] == null ? null : json["humidity"],
        tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
        tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
        seaLevel:
            json["sea_level"] == null ? null : json["sea_level"].toDouble(),
        grndLevel:
            json["grnd_level"] == null ? null : json["grnd_level"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp == null ? null : temp,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "temp_min": tempMin == null ? null : tempMin,
        "temp_max": tempMax == null ? null : tempMax,
        "sea_level": seaLevel == null ? null : seaLevel,
        "grnd_level": grndLevel == null ? null : grndLevel,
      };
}

class Sys {
  double message;
  String country;
  int sunrise;
  int sunset;

  Sys({
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  Sys copyWith({
    double message,
    String country,
    int sunrise,
    int sunset,
  }) =>
      Sys(
        message: message ?? this.message,
        country: country ?? this.country,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );

  factory Sys.fromRawJson(String str) => Sys.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        message: json["message"] == null ? null : json["message"].toDouble(),
        country: json["country"] == null ? null : json["country"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "country": country == null ? null : country,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
      };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather copyWith({
    int id,
    String main,
    String description,
    String icon,
  }) =>
      Weather(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : json["main"],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : main,
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
      };
}

class Wind {
  double speed;
  int deg;

  Wind({
    this.speed,
    this.deg,
  });

  Wind copyWith({
    double speed,
    int deg,
  }) =>
      Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
      );

  factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] == null ? null : json["speed"].toDouble(),
        deg: json["deg"] == null ? null : json["deg"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed == null ? null : speed,
        "deg": deg == null ? null : deg,
      };
}
