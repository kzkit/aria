import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aria/provider/weather_data.dart';

class CitySelection extends StatefulWidget {
  @override
  _CitySelectionState createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _cityFocus = FocusNode();

  void _getCityData() {
    Provider.of<WeatherData>(context, listen: false)
        .getCityData(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  focusNode: _cityFocus,
                  textInputAction: TextInputAction.done,
                  controller: _textController,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'City',
                    hintText: 'Kuala Lumpur',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onFieldSubmitted: (value) {
                    _cityFocus.unfocus();
                    _getCityData();
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _getCityData,
            )
          ],
        ),
      ),
    );
  }
}
