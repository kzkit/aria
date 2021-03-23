import '../model/weather.dart';
import 'package:flutter/material.dart';

class WeatherData with ChangeNotifier {
  List<Weather> _weatherList = [];

  List<Weather> get getWeatherData {
    return [..._weatherList];
  }
}
