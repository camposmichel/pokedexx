import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedexx/pages/details/detail_page.dart';
import 'package:pokedexx/pages/home_page.dart';
import 'package:pokedexx/pages/splash_page.dart';

import 'pages/details/cubit/details_page_cubit.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String splash = '/splash';
  static const String detail = '/detail';

  static final routes = <String, WidgetBuilder>{
    splash: (context) => const SplashPage(),
    home: (context) => const HomePage(),
    detail: (context) => BlocProvider(
          create: (_) => DetailsPageCubit(),
          child: const DetailPage(),
        ),
  };
}
