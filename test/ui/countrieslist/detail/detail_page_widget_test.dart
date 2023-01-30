import 'dart:io';

import 'package:countrylist/entites/countries_list_entity.dart';
import 'package:countrylist/ui/countrieslist/detail/countrydetail_page.dart';
import 'package:countrylist/ui/countrieslist/detail/cubit/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  CountriesList data = CountriesList(
      capital: "capital",
      demonym: "demonym",
      flagPng:
          "https://raw.githubusercontent.com/DevTides/countries/master/afg.png",
      name: "Afghanistan",
      nativeName: "nativeName",
      region: "region");

  // testWidgets('Find Favorite Icon is Hidden', (WidgetTester tester) async {
  //   await tester.runAsync(() async {
  //     await tester.pumpWidget(MaterialApp(
  //       home: BlocProvider(
  //         create: (context) => DetailCubit(),
  //         child: DetailPage(
  //           countryDetails: data,
  //           onFavoriteAdded: () {},
  //         ),
  //       ),
  //     ));

  //     var favICon = find.byIcon(Icons.favorite_border);

  //     expect(favICon, findsNothing);
  //   });
  // });
}
