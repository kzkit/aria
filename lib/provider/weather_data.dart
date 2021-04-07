import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherData with ChangeNotifier {
  List<Weather> _weatherList = [];
  var _token = '25712e0e3821a9a40e018e18fd2d8d9783cf7d90';

  List<Weather> get getWeatherData {
    return [..._weatherList];
  }

  void getCityData(cityName) async {
    var uri = Uri.parse('https://api.waqi.info/feed/$cityName/?token=$_token');
    var response = await http.get(uri);
    print(json.decode(response.body));
  }
}
