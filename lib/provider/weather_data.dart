import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherData with ChangeNotifier {
  List<Weather> _weatherList = [];

  List<Weather> get getWeatherData {
    return [..._weatherList];
  }

  void getCityData(String cityName) async {
    var _airToken = 'X';
    var _weatherToken = 'X';
    Position position;
    _weatherList = [];

    if (cityName.length > 0) {
      var airData = await _getAQI(cityName, _airToken);
      if (airData['status'] == 'error' &&
          airData['message'] == 'Unknown city') {
        position = await _determinePosition();
      }

      if ((airData['data']['city']['geo'][0] != null &&
              airData['data']['city']['geo'][1] != null) ||
          (position.longitude != null && position.latitude != null)) {
        var lat = airData['data']['city']['geo'][0] != null
            ? airData['data']['city']['geo'][0]
            : position.latitude;
        var long = airData['data']['city']['geo'][1] != null
            ? airData['data']['city']['geo'][1]
            : position.longitude;

        var weatherData = await _getWeather(lat, long, _weatherToken);
        for (var i = 0; i < weatherData['daily'].length; i++) {
          if (i == 0) {
            _weatherList.add(
              Weather(
                aqi: airData['data']['aqi'],
                lat: airData['data']['city']['geo'][0],
                long: airData['data']['city']['geo'][1],
                date: airData['data']['time']['iso'],
                city: airData['data']['city']['name'],
                weather: weatherData['daily'][i]['temp']['day'],
                weatherId: weatherData['daily'][i]['weather'][0]['icon'],
              ),
            );
          } else {
            _weatherList.add(
              Weather(
                weather: weatherData['daily'][i]['temp']['day'],
                weatherId: weatherData['daily'][i]['weather'][0]['icon'],
              ),
            );
          }
        }
      }
    }
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

  Future<dynamic> _getAQI(String cityName, String _airToken) async {
    var airUri =
        Uri.parse('https://api.waqi.info/feed/$cityName/?token=$_airToken');
    var airResponse = await http.get(airUri);
    return json.decode(airResponse.body);
  }

  Future<dynamic> _getWeather(
      double lat, double long, String _weatherToken) async {
    var weatherUri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&units=metric&exclude=current,minutely,hourly,alerts&appid=$_weatherToken');
    var weatherResponse = await http.get(weatherUri);
    return json.decode(weatherResponse.body);
  }
}
