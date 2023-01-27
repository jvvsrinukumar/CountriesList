import 'package:countrylist/app/app.dart';
import 'package:countrylist/utlis/user_defaults.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await UserDefaults.init();
  runApp(const MyApp());
}
