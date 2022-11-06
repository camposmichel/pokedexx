import 'package:flutter/material.dart';
import 'package:pokedexx/pages/detail_page.dart';
import 'package:pokedexx/pages/home_page.dart';
import 'package:pokedexx/pages/splash_page.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String splash = '/splash';
  static const String detail = '/detail';

  static final routes = <String, WidgetBuilder>{
    splash: (context) => const SplashPage(),
    home: (context) => const HomePage(),
    detail: (context) => const DetailPage(),
  };
}
