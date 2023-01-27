import 'package:countrylist/repositories/list_repository.dart';
import 'package:countrylist/resources/strings_manager.dart';
import 'package:countrylist/ui/countrieslist/countries_list_page.dart';
import 'package:countrylist/ui/countrieslist/cubit/countries_cubit.dart';
import 'package:countrylist/ui/countrieslist/detail/countrydetail_page.dart';
import 'package:countrylist/ui/countrieslist/detail/cubit/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String listRoute = "/";
  static const String detailRoute = "/detail";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.listRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => CountriesCubit(ListRepository()),
                child: const CountriesListPage()));
                  case Routes.detailRoute:
       Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => DetailCubit(), child: DetailPage(
                   countryDetails: arguments["countryDetails"],
                   onFavoriteAdded: arguments["onFavoriteAdded"],
                )));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
