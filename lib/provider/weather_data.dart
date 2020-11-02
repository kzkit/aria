import '../model/weather.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class WeatherData with ChangeNotifier {
  List<Weather> weatherList = [];
}
