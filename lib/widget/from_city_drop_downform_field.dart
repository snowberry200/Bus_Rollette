import 'package:bus_rullette/bloc/search_bloc.dart';
import 'package:bus_rullette/widget/form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bus_rullette/widget/collections/list_cities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FromCityDropDownWidget extends StatefulWidget {
  final GlobalKey<FormWidgetState> formWidgetKey;

  const FromCityDropDownWidget({super.key, required this.formWidgetKey});

  @override
  State<FromCityDropDownWidget> createState() => FromCityDropDownWidgetState();
}

class FromCityDropDownWidgetState extends State<FromCityDropDownWidget> {
  String? fromCity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final fromCityBloc = widget.formWidgetKey.currentState?.formBloc;
        return DropdownButtonFormField<String>(
          autovalidateMode: AutovalidateMode.onUnfocus,
          dropdownColor: CupertinoColors.black,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          icon: const Icon(Icons.arrow_drop_down_circle, color: Colors.grey),
          iconEnabledColor: Colors.green,
          hint: const Text(
            "from:",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          value: state.fromCity,
          onChanged: (value) {
            if (value != null) {
              fromCity = value;
              fromCityBloc?.add(FromCityChangeEvent(fromCity: state.fromCity));
              if (kDebugMode) {
                print(fromCity);
              }
            }
          },
          items: cities.map((city) {
            return DropdownMenuItem(value: city, child: Text(city));
          }).toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a departure city';
            }
            return null;
          },
        );
      },
    );
  }
}
