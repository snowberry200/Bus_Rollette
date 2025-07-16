import 'package:bus_rullette/bloc/search_bloc.dart';
import 'package:bus_rullette/widget/form_widget.dart';
import 'package:bus_rullette/widget/from_city_drop_downform_field.dart';
import 'package:bus_rullette/widget/row_widget.dart';
import 'package:bus_rullette/widget/search_validation.dart';
import 'package:bus_rullette/widget/to_city_drop_downformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final GlobalKey<FromCityDropDownWidgetState> fromCityKey;
  final GlobalKey<ToCityDropDownWidgetState> toCityKey;
  final GlobalKey<RowWidgetState> rowWidgetKey;
  final GlobalKey<FormWidgetState> formWidgetKey;

  const ElevatedButtonWidget({
    super.key,
    required this.fromCityKey,
    required this.toCityKey,
    required this.rowWidgetKey,
    required this.formKey,
    required this.formWidgetKey,
  });

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  bool isLoading = false;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = widget.formKey;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is LoadingSearchState ? null : _handleSearch,
          child: state is LoadingSearchState
              ? SearchValidation.showProgressiveBar()
              : (Text("Search")),
        );
      },
    );
  }

  Future<void> _handleSearch() async {
    final eButtonBloc = widget.formWidgetKey.currentState?.formBloc;
    final formState = formKey.currentState!.validate();
    if (!formState) {
      if (mounted) {
        return;
      }
    }

    if (formState) {
      // Safely get all values first
      final fromCity = widget.fromCityKey.currentState?.fromCity;
      final toCity = widget.toCityKey.currentState?.toCity;
      final departureDate = widget.rowWidgetKey.currentState?.departureDate;

      // setState(() => isLoading = true);
      try {
        eButtonBloc?.add(
          SearchButtonPressedEvent(
            departureDate: departureDate,
            fromCity: fromCity,
            toCity: toCity,
            isLoading: true,
          ),
        );
        final isValid = SearchValidation.validateSearch(
          context: context,
          fromCity: fromCity,
          toCity: toCity,
          departureDate: departureDate,
          isLoading: true,
        );

        if (!isValid && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 4),
              content: Text('Search failed'),
            ),
          );
        }
      } finally {
        if (mounted) {
          eButtonBloc?.add(
            SearchButtonPressedEvent(
              departureDate: departureDate,
              fromCity: fromCity,
              toCity: toCity,
              isLoading: false,
            ),
          );
        }
        //setState(() => isLoading = false);
      }
    }
  }
}
