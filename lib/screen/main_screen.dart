import 'package:aria/widgets/city_selection.dart';
import 'package:aria/widgets/forecast.dart';
import 'package:aria/widgets/weather.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Weather(),
            CitySelection(),
            Forecast(),
          ],
        ),
      ),
    );
  }
}
