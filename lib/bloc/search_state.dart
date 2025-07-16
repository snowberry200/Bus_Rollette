// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

//enum SearchStatus { initial, loading, success, error }

abstract class SearchState {
  final DateTime? departureDate;
  final String? fromCity;
  final String? toCity;
  final bool? isLoading;
  final String? errorMessage;
  final Object? resultedState;

  const SearchState({
    this.departureDate,
    this.fromCity,
    this.toCity,
    this.isLoading = false,
    this.errorMessage,
    this.resultedState,
  });
  factory SearchState.initial(SearchState prevState) {
    return _InitialSearchState(
      fromCity: prevState.fromCity,
      toCity: prevState.toCity,
      departureDate: prevState.departureDate,
      isLoading: prevState.isLoading,
      resultedState: prevState.resultedState,
    );
  }

  factory SearchState.loading(SearchState prevState) {
    return LoadingSearchState(
      isLoading: prevState.isLoading,
      resultedState: prevState.resultedState,
      fromCity: prevState.fromCity,
      toCity: prevState.toCity,
      departureDate: prevState.departureDate,
    );
  }

  factory SearchState.success(SearchState prevState) {
    return _SuccessSearchState(
      fromCity: prevState.fromCity,
      toCity: prevState.toCity,
      departureDate: prevState.departureDate,
      isLoading: false,
      resultedState: prevState.resultedState,
    );
  }
  factory SearchState.error(SearchState prevState) {
    return _ErrorSearchState(
      fromCity: prevState.fromCity,
      toCity: prevState.toCity,
      departureDate: prevState.departureDate,
      errorMessage: prevState.errorMessage,
      isLoading: false,
    );
  }

  // SearchState copyWith({
  //   DateTime? departureDate,
  //   String? fromCity,
  //   String? toCity,
  //   bool? isLoading,
  //   String? errorMessage,
  //   Object? resultedState,
  // }) {
  //   return SearchState(
  //     departureDate: departureDate ?? this.departureDate,
  //     fromCity: fromCity ?? this.fromCity,
  //     toCity: toCity ?? this.toCity,
  //     isLoading: isLoading ?? this.isLoading,
  //     errorMessage: errorMessage ?? this.errorMessage,
  //     resultedState: resultedState ?? this.resultedState,
  //   );
  // }
}

class _InitialSearchState extends SearchState {
  _InitialSearchState({
    super.isLoading = false,
    super.resultedState,
    super.fromCity,
    super.toCity,
    super.departureDate,
  }) : super();
}

class LoadingSearchState extends SearchState {
  const LoadingSearchState({
    super.isLoading = true,
    super.resultedState,
    super.fromCity,
    super.toCity,
    super.departureDate,
  }) : super();
}

class _SuccessSearchState extends SearchState {
  const _SuccessSearchState({
    super.isLoading = false,
    super.resultedState,
    super.fromCity,
    super.toCity,
    super.departureDate,
  }) : super();
}

class _ErrorSearchState extends SearchState {
  const _ErrorSearchState({
    required super.errorMessage,
    super.fromCity,
    super.toCity,
    super.departureDate,
    super.isLoading = false,
  });
}
