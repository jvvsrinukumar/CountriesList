import 'package:countrylist/repositories/list_repository.dart';
import 'package:countrylist/ui/countrieslist/countries_list_page.dart';
import 'package:countrylist/ui/countrieslist/cubit/countries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
// WidgetsFlutterBinding.ensureInitialized();

  testWidgets('Find Search Textfeild', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => CountriesCubit(ListRepository()),
          child: const CountriesListPage(),
        ),
      ));

      var textField = find.byType(TextField);
      expect(textField, findsOneWidget);
    });
  });

  testWidgets('Find Favorite Icon is Hidden', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => CountriesCubit(ListRepository()),
          child: const CountriesListPage(),
        ),
      ));

      var favICon = find.byIcon(Icons.favorite);

      expect(favICon, findsNothing);
    });
  });
}
