import 'package:flutter/material.dart';
import 'package:pokedexx/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: Routes.routes,
      initialRoute: Routes.home,
    );
  }
}
