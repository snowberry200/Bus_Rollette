import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RowWidget extends StatefulWidget {
  final DateTime? departureDate;

  const RowWidget({super.key, this.departureDate});

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
    // return BlocBuilder<SearchBloc, SearchState>(
    // builder: (context, state) {
    // final rowBloc = context.read<SearchBloc>();
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
          departureDate != null
              ? getFormattedDate(departureDate!)
              : "please select a date",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
    // },
    // );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 28)),
    );
    if (selectedDate != null) {
      //rowBloc.add(DateChangeEvent(departureDate: selectedDate));
      setState(() {
        departureDate = selectedDate;
      });
    }
    return departureDate;
  }

  String getFormattedDate(
    DateTime departureDate, {
    String pattern = "dd/MM/yyyy",
  }) {
    return DateFormat(pattern).format(departureDate);
  }
}
