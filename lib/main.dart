import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedexx/cubits/providers.dart';
import 'package:pokedexx/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CubitProviders.providers,
      child: MaterialApp(
        title: 'Pokedexx',
        theme: ThemeData(
          primarySwatch: Colors.red,
          canvasColor: Colors.transparent,
        ),
        routes: Routes.routes,
        initialRoute: Routes.home,
      ),
    );
  }
}
