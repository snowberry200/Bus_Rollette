import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bus_rullette/datasource/temp_db.dart';
import 'package:bus_rullette/models/but_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SearchBloc({required this.formKey}) : super(InitialState()) {
    on<CityChangeEvent>(_onCityChanged);
    on<DateChangedEvent>(_onDateChanged);
    on<OnCitySearchButtonPressedEvent>(_onSearchButtonPressed);
  }

  void _onCityChanged(CityChangeEvent event, Emitter<SearchState> emit) {
    emit(
      SearchState(
        fromCity: event.fromCity ?? state.fromCity,
        toCity: event.toCity ?? state.toCity,
        departureDate: state.departureDate,
        isLoading: state.isLoading,
        resultedState: state.resultedState,
        errorMessage: state.errorMessage,
      ),
    );
  }

  void _onDateChanged(DateChangedEvent event, Emitter<SearchState> emit) {
    {
      emit(
        SearchState(
          fromCity: state.fromCity,
          toCity: state.toCity,
          departureDate: event.departureDate,
          isLoading: state.isLoading,
          resultedState: state.resultedState,
          errorMessage: state.errorMessage,
        ),
      );
    }
  }

  Future<void> _onSearchButtonPressed(
    OnCitySearchButtonPressedEvent event,
    Emitter<SearchState> emit,
  ) async {
    // loading state
    emit(SearchLoading(state));

    try {
      final route = TempDB.tableRoute.firstWhere(
        (element) =>
            element.cityFrom == event.fromCity &&
            element.cityTo == event.toCity,
      );
      emit(SearchSuccess(state: state, route: route));
    } on SearchError {
      emit(SearchError(state, 'No buses found for this route'));
    } catch (e) {
      emit(SearchError(state, 'Search failed: ${e.toString()}'));
    }
  }
}
