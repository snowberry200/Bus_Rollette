import 'package:bus_rullette/widget/collections/list_cities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToCityDropDownWidget extends StatefulWidget {
  final String? toCity;

  const ToCityDropDownWidget({super.key, this.toCity});

  @override
  State<ToCityDropDownWidget> createState() => ToCityDropDownWidgetState();
}

class ToCityDropDownWidgetState extends State<ToCityDropDownWidget> {
  String? toCity;
  @override
  void initState() {
    super.initState();
    toCity = widget.toCity;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: CupertinoColors.black,
      value: toCity,
      style: TextStyle(color: Colors.white, fontSize: 20),
      icon: Icon(Icons.arrow_drop_down_circle, color: Colors.grey),
      iconEnabledColor: Colors.blue,
      hint: Text(
        "to:",
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
      items: cities.map((city) {
        return DropdownMenuItem<String>(value: city, child: Text(city));
      }).toList(),
      onChanged: (value) {
        setState(() {
          toCity = value;
        });
      },
    );
  }
}
