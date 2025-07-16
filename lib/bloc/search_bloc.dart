import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bus_rullette/widget/search_validation.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SearchBloc({required this.formKey})
    : super(SearchState.initial(_InitialSearchState())) {
    on<FromCityChangeEvent>(_onFromCityChanged);
    on<ToCityChangeEvent>(_onToCityChanged);
    on<DateChangeEvent>(_onDateChanged);
    on<SearchButtonPressedEvent>(_onSearchButtonPressed);
  }

  FutureOr<void> _onFromCityChanged(
    FromCityChangeEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchState.initial(_SuccessSearchState(fromCity: event.fromCity)));
  }

  FutureOr<void> _onToCityChanged(
    ToCityChangeEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchState.initial(_SuccessSearchState(toCity: event.toCity)));
  }

  FutureOr<void> _onDateChanged(
    DateChangeEvent event,
    Emitter<SearchState> emit,
  ) {
    SearchState.initial(
      _SuccessSearchState(departureDate: event.departureDate),
    );
  }

  FutureOr<void> _onSearchButtonPressed(
    SearchButtonPressedEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(
      SearchState.success(
        _SuccessSearchState(
          resultedState: SearchValidation.validateSearch,
          fromCity: event.fromCity,
          toCity: event.toCity,
          departureDate: event.departureDate,
        ),
      ),
    );
  }
}
