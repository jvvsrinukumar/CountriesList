

import 'package:bloc_test/bloc_test.dart';
import 'package:countrylist/repositories/list_repository.dart';
import 'package:countrylist/ui/countrieslist/cubit/countries_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockListRepository extends Mock implements ListRepository{}
void main() {
    group('TaskCubit test', () {
    late CountriesCubit taskCubit;
    MockListRepository mockTaskRepository;
    setUp(() {
      EquatableConfig.stringify = true;
      mockTaskRepository = MockListRepository();
      taskCubit = CountriesCubit(mockTaskRepository);
    });
    blocTest<CountriesCubit, CountriesState>(
      'emits [CountriesLoading, CountriesLoaded ] states for'
      'successful task loads',
      build: () => taskCubit,
      act: (bloc) => bloc.fetchCountries(),
      expect: () => [
        CountriesLoading(),
        CountriesLoaded(),
      ],
    );

      blocTest<CountriesCubit, CountriesState>(
      'emits [CountriesLoading, CountriesFetchFailure ] states for'
      'failure task loads',
      build: () => taskCubit,
      act: (bloc) => bloc.fetchCountries(),
      expect: () => [
        CountriesLoading(),
        CountriesFetchFailure(),
      ],
    );
  });
}