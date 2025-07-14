import 'package:bus_rullette/widget/elevated_button.dart';
import 'package:bus_rullette/widget/from_city_drop_downform_field.dart';
import 'package:bus_rullette/widget/row_widget.dart';
import 'package:bus_rullette/widget/to_city_drop_downformfield.dart';
import 'package:flutter/material.dart';

class FormWidgetMap {
  final GlobalKey<FormState> formKey;
  final GlobalKey<FromCityDropDownWidgetState> fromCityKey;
  final GlobalKey<ToCityDropDownWidgetState> toCityKey;
  final GlobalKey<RowWidgetState> rowWidgetKey;

  FormWidgetMap({
    required this.formKey,
    required this.fromCityKey,
    required this.toCityKey,
    required this.rowWidgetKey,
  });

  Map<String, Widget> get widgets => {
    'from': FromCityDropDownWidget(key: fromCityKey),
    'to': ToCityDropDownWidget(key: toCityKey),
    'selectDate': RowWidget(key: rowWidgetKey),
    'searchButton': ElevatedButtonWidget(
      formKey: formKey,
      fromCityKey: fromCityKey,
      toCityKey: toCityKey,
      rowWidgetKey: rowWidgetKey,
    ),
  };
}
