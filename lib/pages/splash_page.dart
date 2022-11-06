import 'package:flutter/material.dart';
import 'package:pokedexx/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _width = 0;
  double _height = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _width = MediaQuery.of(context).size.width;
        _height = MediaQuery.of(context).size.height;
      });
    });
    Future.delayed(const Duration(seconds: 3, milliseconds: 500), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(seconds: 2),
          child: SizedBox(
            width: _width,
            height: _height,
            child: Image.asset(
              'assets/images/pikachu.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
