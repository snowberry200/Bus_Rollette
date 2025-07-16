import 'package:bus_rullette/datasource/temp_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchValidation {
  static bool validateSearch({
    required BuildContext context,
    required String? fromCity,
    required String? toCity,
    required DateTime? departureDate,
    required bool isLoading,
  }) {
    // Validate inputs
    if (context.mounted && isLoading == true) {
      showProgressiveBar();
    }
    if (fromCity == null || toCity == null) {
      showError(context, "Please fill all fields");
      return false;
    }
    if (departureDate == null) {
      showError(context, "Please select date");
      return false;
    }
    if (fromCity.isEmpty || toCity.isEmpty) {
      showError(context, "Both cities must be selected");
      return false;
    }

    if (fromCity == toCity) {
      showError(context, "Cities cannot be identical");
      return false;
    }

    if (departureDate.isBefore(DateTime.now())) {
      showError(context, "Please select a future date");
      return false;
    }

    //Validate route

    try {
      _showProgress(context, "Searching for routes...");
      Future.delayed(const Duration(seconds: 1)); // Simulate network

      final route = TempDB.tableRoute.firstWhere(
        (element) => element.cityFrom == fromCity && element.cityTo == toCity,
      );
      if (context.mounted) {
        _showSuccess(context, "Found route: ${route.routeName}");
      }
      return true;
    } on StateError {
      if (context.mounted) {
        showError(context, "No buses found for this route");
      }
      return false;
    } catch (e) {
      if (context.mounted) {
        showError(context, "Search failed: ${e.toString()}");
      }
      return false;
    }
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  static void _showProgress(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.blue),
    );
  }

  static void _showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  static CircularProgressIndicator showProgressiveBar() {
    return const CircularProgressIndicator(
      strokeCap: StrokeCap.round,
      backgroundColor: CupertinoColors.systemBlue,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      strokeWidth: 3.0,
    );
  }
}
