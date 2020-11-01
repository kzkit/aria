import 'package:flutter/material.dart';

class Weather {
  final String id;
  final String city;
  final String airQuality;
  final String weather;

  Weather({
    @required this.id,
    @required this.city,
    @required this.airQuality,
    @required this.weather,
  });
}
