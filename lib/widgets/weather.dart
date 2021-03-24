import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Kuala Lumpur',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text('Light Drizzle'),
        ),
        Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset(
              'assets/sunny.png',
              scale: 3,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '12°C',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Air Quality is good',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
