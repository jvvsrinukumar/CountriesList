import 'package:bloc_test/bloc_test.dart';
import 'package:countrylist/entites/countries_list_entity.dart';

import 'package:countrylist/repositories/list_repository.dart';
import 'package:countrylist/ui/countrieslist/cubit/countries_cubit.dart';
import 'package:countrylist/utlis/constants.dart';
import 'package:countrylist/utlis/user_defaults.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:mockito/mockito.dart';

class MockListRepository extends Mock implements ListRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  const String baseUrl = Constants.baseUrl;
  late Dio dio;
  late DioAdapter dioAdapter;

  List<CountriesList> data = [
    CountriesList(capital: "capital", demonym: "demonym", flagPng: "flagPng", name: "Afghanistan", nativeName: "nativeName", region: "region")
  ];

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
  });

  
  group('Cubit Success Scenarios: ', () {
    blocTest<CountriesCubit, CountriesState>(
      'Countries data success',
      setUp: (() {
        return dioAdapter.onGet(
          "$baseUrl${Constants.countriesList}",
          (request) => request.reply(200, []),
        );
      }),
      build: () => CountriesCubit(ListRepository()),
      act: (bloc) => bloc.fetchCountries(),
      wait: const Duration(milliseconds: 500),
      expect: () => [CountriesLoading(), CountriesLoaded()],
    );

    blocTest<CountriesCubit, CountriesState>(
      'Search country no found',
      setUp: (() {
        return dioAdapter.onGet(
          "$baseUrl${Constants.countriesList}",
          (request) => request.reply(200, []),
        );
      }),
      build: () => CountriesCubit(ListRepository()),
      act: (bloc) => bloc.searchCountries("Afghan",data),
      wait: const Duration(milliseconds: 500),
      expect: () =>
          [CountriesLoading(), const CountriesSearchState("Afghanistan")],
    );

    blocTest<CountriesCubit, CountriesState>(
      'Search  Succcess',
      setUp: (() {
        return dioAdapter.onGet(
          "$baseUrl${Constants.countriesList}",
          (request) => request.reply(200, data),
        );
      }),
      build: () => CountriesCubit(ListRepository()),
      act: (bloc) => bloc.searchCountries("Afghanistan",data),
      wait: const Duration(milliseconds: 500),
      expect: () =>
          [CountriesLoading(),  CountriesLoaded()],
    );
  });

  group('Error scenarios: ', () {
    blocTest<CountriesCubit, CountriesState>(
      'emits failure at initial response is null',
      setUp: (() {
        return dioAdapter.onGet(
          "$baseUrl${Constants.countriesList}",
          (request) => request.reply(200, null),
        );
      }),
      build: () => CountriesCubit(ListRepository()),
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.fetchCountries(),
      expect: () => [CountriesLoading(), CountriesFetchFailure()],
    );
  });
}
