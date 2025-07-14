import 'package:bus_rullette/widget/from_city_drop_downform_field.dart';
import 'package:bus_rullette/widget/row_widget.dart';
import 'package:bus_rullette/widget/search_validation.dart';
import 'package:bus_rullette/widget/to_city_drop_downformfield.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final GlobalKey<FromCityDropDownWidgetState> fromCityKey;
  final GlobalKey<ToCityDropDownWidgetState> toCityKey;
  final GlobalKey<RowWidgetState> rowWidgetKey;

  const ElevatedButtonWidget({
    super.key,
    required this.formKey,
    required this.fromCityKey,
    required this.toCityKey,
    required this.rowWidgetKey,
  });

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handleSearch,
      child: _isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: SearchValidation.showProgressiveBar(),
            )
          : const Text('Search'),
    );
  }

  Future<void> _handleSearch() async {
    final fromCity = widget.fromCityKey.currentState?.fromCity;
    final toCity = widget.toCityKey.currentState?.toCity;
    final departureDate = widget.rowWidgetKey.currentState?.departureDate;

    if (widget.formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final result = await SearchValidation.validateSearch(
          context: context,
          fromCity: fromCity,
          toCity: toCity,
          departureDate: departureDate,
          isLoading: _isLoading,
        );

        if (!result && mounted) {
          null;
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }
}
