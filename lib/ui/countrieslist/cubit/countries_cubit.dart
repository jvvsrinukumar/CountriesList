// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:countrylist/entites/countries_list_entity.dart';
import 'package:countrylist/repositories/list_repository.dart';
import 'package:countrylist/utlis/constants.dart';
import 'package:countrylist/utlis/user_defaults.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  ListRepository repository;
  final _countriesLst = BehaviorSubject<List<CountriesList>>();
  Stream<List<CountriesList>> get lstStream => _countriesLst.stream;

  final emailController = TextEditingController();

  final _emailController = BehaviorSubject<String>();
  Stream<String> get emailStream => _emailController.stream;

  List<CountriesList> data = [];
  late CountriesList favCountry;

  CountriesCubit(this.repository) : super(CountriesInitial());

  Future<void> fetchCountries() async {
    emit(CountriesLoading());
    //final response = await repository.getList(); 
    List<CountriesList>? list = await repository.getList();
    if (list != null) {
      data = list;
      _countriesLst.sink.add(data);
       emit(CountriesLoaded());    
    } else {
      emit(CountriesFetchFailure());
    }
  }

  Future<void> searchCountries(String name, List<CountriesList> lst) async {
    emit(CountriesLoading());
    if (name.isNotEmpty) {
      _countriesLst.sink.add([]);
      List<CountriesList> countries = lst
          .where((e) => e.name.toLowerCase() == name.toLowerCase())
          .toList();
      if (countries.isNotEmpty) {
        _countriesLst.sink.add(countries);
        emit(CountriesLoaded());
      } else {
        emit(CountriesSearchState(name));
      }
    } else {
    fetchCountries();
    }
  }

 getFavorite()  {
    emit(CountriesInitial());
    if (UserDefaults.getString(Constants.kFavoriteCountry).isNotEmpty) {
      _countriesLst.sink.add([]);
      List<CountriesList> ing = data
          .where((e) => e.name.toLowerCase() == UserDefaults.getString(Constants.kFavoriteCountry).toLowerCase())
          .toList();
      if (ing.isNotEmpty) {
       favCountry = ing[0];
        _countriesLst.sink.add([favCountry]);
        emit(CountriesListFavState());
      } 
    } else {
      fetchCountries();
    }
  }
}
