import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longitude;

  // Singleton START
  Location._constructor() {
    if ((this._latitude == null) || this._longitude == null) {
      this.getCurrentLocation();
    }
  }

  static final Location _instance = Location._constructor();

  factory Location() => _instance;
  // Singleton END

  double get latitude => _latitude;

  double get longitude => _longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      this._latitude = position.latitude;
      this._longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
