part of 'countries_cubit.dart';

abstract class CountriesState extends Equatable {
  const CountriesState();

  @override
  List<Object> get props => [];
}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {}

class CountriesFetchFailure extends CountriesState {}

class CountriesSearchState extends CountriesState {
  final String search;
  const CountriesSearchState(this.search);
}

class CountriesListFavState extends CountriesState {}
