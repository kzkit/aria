import 'package:flutter/material.dart';

class DailyWeatherDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Color.fromRGBO(196, 203, 254, 0.8),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('Thu 9pm'),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    'assets/sunny.png',
                    scale: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('123'),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('Thu 9pm'),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    'assets/sunny.png',
                    scale: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('123'),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('Thu 9pm'),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    'assets/sunny.png',
                    scale: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('123'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
