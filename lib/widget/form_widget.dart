import 'package:bus_rullette/widget/collections/map_of_widgets.dart';
import 'package:bus_rullette/widget/from_city_drop_downform_field.dart';
import 'package:bus_rullette/widget/row_widget.dart';
import 'package:bus_rullette/widget/to_city_drop_downformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  final fromCityKey = GlobalKey<FromCityDropDownWidgetState>();
  final toCityKey = GlobalKey<ToCityDropDownWidgetState>();
  final rowWidgetKey = GlobalKey<RowWidgetState>();

  late final FormWidgetMap formWidgetMap = FormWidgetMap(
    formKey: formKey,
    fromCityKey: fromCityKey,
    toCityKey: toCityKey,
    rowWidgetKey: rowWidgetKey,
  );

  static const double minWidth = 200.0;
  static const double sizedHeight = 20.0;
  static const double edgePaddings = 30.0;

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: minWidth),
      child: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(edgePaddings),
            child: ListView(
              shrinkWrap: true,
              children: [
                formWidgetMap.widgets['from']!,
                const SizedBox(height: sizedHeight),
                formWidgetMap.widgets['to']!,
                const SizedBox(height: sizedHeight),
                formWidgetMap.widgets['selectDate']!,
                const SizedBox(height: sizedHeight),
                formWidgetMap.widgets['searchButton']!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
