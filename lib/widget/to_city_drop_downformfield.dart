import 'package:bus_rullette/bloc/search_bloc.dart';
import 'package:bus_rullette/widget/collections/list_cities.dart';
import 'package:bus_rullette/widget/form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToCityDropDownWidget extends StatefulWidget {
  final GlobalKey<FormWidgetState> formWidgetKey;

  final String? toCity;

  const ToCityDropDownWidget({
    super.key,
    this.toCity,
    required this.formWidgetKey,
  });

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
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        final toCityBloc = widget.formWidgetKey.currentState?.formBloc;
        return DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUnfocus,
          dropdownColor: CupertinoColors.black,
          value: state.toCity,
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
            toCity = value;
            toCityBloc?.add(ToCityChangeEvent(toCity: state.toCity));
            if (kDebugMode) {
              print(toCity);
            }
          },
        );
      },
    );
  }
}
