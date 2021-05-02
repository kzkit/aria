import 'package:flutter/material.dart';
import 'package:aria/widgets/city_selection.dart';
import 'package:aria/widgets/forecast.dart';
import 'package:aria/widgets/weather.dart';
import 'package:aria/widgets/weather_details.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .34,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/city_background.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Weather(),
                CitySelection(),
                Forecast(),
                WeatherDetails(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
