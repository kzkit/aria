import 'package:flutter/material.dart';
import 'package:aria/widgets/daily_forecast.dart';

class Forecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Text(
            'Forecast',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DailyForecast(),
              DailyForecast(),
              DailyForecast(),
            ],
          ),
        ),
      ],
    );
  }
}
