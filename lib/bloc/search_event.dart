part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class CityChangeEvent extends SearchEvent {
  final String? fromCity;
  final String? toCity;
  CityChangeEvent({required this.fromCity, required this.toCity});
}

class DateChangedEvent extends SearchEvent {
  final DateTime? departureDate;
  DateChangedEvent({required this.departureDate});
}

class OnCitySearchButtonPressedEvent extends SearchEvent {
  late final bool isLoading;
  final String? fromCity;
  final String? toCity;
  final DateTime? departureDate;
  OnCitySearchButtonPressedEvent({
    required this.fromCity,
    required this.toCity,
    required this.departureDate,
    required this.isLoading,
  });
}
