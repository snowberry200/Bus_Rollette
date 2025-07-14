// ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'search_bloc.dart';

// class SearchState {
//   DateTime? departureDate;
//   String? fromCity;
//   String? toCity;
//   bool? isLoading;
//   String? errorMessage;
//   Object? resultedState;
//   SearchState({
//     this.departureDate,
//     this.fromCity,
//     this.toCity,
//     this.isLoading,
//     this.errorMessage,
//     this.resultedState,
//   });

//   SearchState copyWith({
//     DateTime? departureDate,
//     String? fromCity,
//     String? toCity,
//     bool? isLoading,
//     String? errorMessage,
//     Object? resultedState,
//   }) {
//     return SearchState(
//       departureDate: departureDate ?? this.departureDate,
//       fromCity: fromCity ?? this.fromCity,
//       toCity: toCity ?? this.toCity,
//       isLoading: isLoading ?? this.isLoading,
//       errorMessage: errorMessage ?? this.errorMessage,
//       resultedState: resultedState ?? this.resultedState,
//     );
//   }
// }

part of 'search_bloc.dart';

class SearchState {
  DateTime? departureDate;
  String? fromCity;
  String? toCity;
  bool? isLoading;
  String? errorMessage;
  Object? resultedState;
  SearchState({
    this.departureDate,
    this.fromCity,
    this.toCity,
    this.isLoading,
    this.errorMessage,
    this.resultedState,
  });
}

class InitialState extends SearchState {
  InitialState() : super();
}

class SearchLoading extends SearchState {
  SearchState state;
  SearchLoading(this.state)
    : super(
        departureDate: state.departureDate,
        fromCity: state.fromCity,
        toCity: state.toCity,
        isLoading: state.isLoading == true,
      );
}

class SearchSuccess extends SearchState {
  final BusRoute route;
  final SearchState state;
  SearchSuccess({required this.state, required this.route})
    : super(
        departureDate: state.departureDate,
        fromCity: state.fromCity,
        toCity: state.toCity,
        isLoading: state.isLoading == false,
      );
}

class SearchError extends SearchState {
  final String message;

  SearchError(SearchState state, this.message)
    : super(
        fromCity: state.fromCity,
        toCity: state.toCity,
        departureDate: state.departureDate,
      );
}
