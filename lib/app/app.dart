


import 'package:countrylist/resources/routes_manager.dart';
import 'package:countrylist/resources/theme_manager.dart';

import 'package:countrylist/utlis/navigation_service.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
  
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.listRoute,
        theme: getApplicationTheme(),
        navigatorKey: NavigationService().navigationKey,
      );
      // return DesktopProductView(title: widget.title, crossAxisCount: crossAxisCount);
    });
  }
}
