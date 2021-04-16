import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherData with ChangeNotifier {
  List<Weather> _weatherList = [];
  var _airToken = 'X';
  var _weatherToken = 'X';

  List<Weather> get getWeatherData {
    return [..._weatherList];
  }

  void getCityData(cityName) async {
    var airUri =
        Uri.parse('https://api.waqi.info/feed/$cityName/?token=$_airToken');
    var airResponse = await http.get(airUri);
    //TODO: extract air quality data
    print(json.decode(airResponse.body));

    //TODO: JUST USE LAT LON FROM THE API RESPONSE FROM AIRURI... only use this method if user pulldown to refresh
    Position position = await _determinePosition();
    var weatherUri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${position.latitude}&lon=${position.longitude}&exclude=hourly&appid=$_weatherToken');
    var weatherResponse = await http.get(weatherUri);
    print(json.decode(weatherResponse.body));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
