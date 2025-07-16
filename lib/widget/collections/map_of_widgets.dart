import 'package:bus_rullette/widget/elevated_button.dart';
import 'package:bus_rullette/widget/form_widget.dart';
import 'package:bus_rullette/widget/from_city_drop_downform_field.dart';
import 'package:bus_rullette/widget/row_widget.dart';
import 'package:bus_rullette/widget/to_city_drop_downformfield.dart';
import 'package:flutter/material.dart';

class FormWidgetMap {
  final GlobalKey<FormState> formKey;
  final GlobalKey<FromCityDropDownWidgetState> fromCityKey;
  final GlobalKey<ToCityDropDownWidgetState> toCityKey;
  final GlobalKey<RowWidgetState> rowWidgetKey;
  final GlobalKey<FormWidgetState> formWidgetKey;

  FormWidgetMap({
    required this.formKey,
    required this.fromCityKey,
    required this.toCityKey,
    required this.rowWidgetKey,
    required this.formWidgetKey,
  });

  Map<String, Widget> get widgets => {
    'from': FromCityDropDownWidget(
      key: fromCityKey,
      formWidgetKey: formWidgetKey,
    ),
    'to': ToCityDropDownWidget(key: toCityKey, formWidgetKey: formWidgetKey),
    'selectDate': RowWidget(key: rowWidgetKey, formWidgetKey: formWidgetKey),
    'searchButton': ElevatedButtonWidget(
      formKey: formKey,
      fromCityKey: fromCityKey,
      toCityKey: toCityKey,
      rowWidgetKey: rowWidgetKey,
      formWidgetKey: formWidgetKey,
    ),
  };
}
