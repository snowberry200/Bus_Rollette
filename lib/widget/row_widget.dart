import 'package:bus_rullette/bloc/search_bloc.dart';
import 'package:bus_rullette/widget/form_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RowWidget extends StatefulWidget {
  final GlobalKey<FormWidgetState> formWidgetKey;

  final DateTime? departureDate;

  const RowWidget({super.key, this.departureDate, required this.formWidgetKey});

  @override
  State<RowWidget> createState() => RowWidgetState();
}

class RowWidgetState extends State<RowWidget> {
  DateTime? departureDate;
  @override
  void initState() {
    super.initState();
    departureDate = widget.departureDate;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => pickDate(context),
              child: Text(
                "Select Date :",
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Text(
              state.departureDate != null
                  ? getFormattedDate(state.departureDate!)
                  : "please select a date",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final rowBloc = widget.formWidgetKey.currentState?.formBloc;
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 28)),
    );
    if (selectedDate != null) {
      departureDate = selectedDate;
      rowBloc?.add(DateChangeEvent(departureDate: departureDate));
      // setState(() {
      //   departureDate = selectedDate;
      // });
    }
    if (kDebugMode) {
      print(departureDate);
    }
    return departureDate;
  }

  String getFormattedDate(departureDate, {String pattern = "dd/MM/yyyy"}) {
    return DateFormat(pattern).format(departureDate);
  }
}
