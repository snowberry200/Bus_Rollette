part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class FromCityChangeEvent extends SearchEvent {
  final String? fromCity;
  FromCityChangeEvent({this.fromCity});
}

class ToCityChangeEvent extends SearchEvent {
  final String? toCity;
  ToCityChangeEvent({this.toCity});
}

class DateChangeEvent extends SearchEvent {
  final DateTime? departureDate;
  DateChangeEvent({required this.departureDate});
}

class SearchButtonPressedEvent extends SearchEvent {
  final String? fromCity;
  final String? toCity;
  final DateTime? departureDate;
  final bool? isLoading;
  SearchButtonPressedEvent({
    required this.fromCity,
    required this.toCity,
    required this.departureDate,
    required this.isLoading,
  });
}

class SearchStateError extends SearchEvent {
  final String? errorMessage;
  SearchStateError({required this.errorMessage});
}
