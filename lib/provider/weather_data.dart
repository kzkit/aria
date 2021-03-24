import 'dart:convert';

import '../model/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WeatherData with ChangeNotifier {
  List<Weather> _weatherList = [];

  List<Weather> get getWeatherData {
    return [..._weatherList];
  }

  void getCityData(cityName) async {
    final token = 'x';
    var url = Uri.parse('https://api.waqi.info/feed/$cityName/?token=$token');

    var response = await http.get(url);
    print(json.decode(response.body));
  }
}
