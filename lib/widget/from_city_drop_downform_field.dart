import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bus_rullette/widget/collections/list_cities.dart';

class FromCityDropDownWidget extends StatefulWidget {
  const FromCityDropDownWidget({super.key});

  @override
  State<FromCityDropDownWidget> createState() => FromCityDropDownWidgetState();
}

class FromCityDropDownWidgetState extends State<FromCityDropDownWidget> {
  String? fromCity;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: CupertinoColors.black,
      style: TextStyle(color: Colors.white, fontSize: 20),
      icon: Icon(Icons.arrow_drop_down_circle, color: Colors.grey),
      iconEnabledColor: Colors.green,
      hint: Text(
        "from:",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
      value: fromCity,
      onChanged: (value) => setState(() => fromCity = value),
      items: cities.map((city) {
        return DropdownMenuItem(value: city, child: Text(city));
      }).toList(),
    );
  }
}
