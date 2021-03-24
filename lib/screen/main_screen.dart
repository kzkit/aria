import 'package:aria/widgets/city_selection.dart';
import 'package:aria/widgets/weather.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aria'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          CitySelection(),
          Weather(),
        ],
      ),
    );
  }
}
