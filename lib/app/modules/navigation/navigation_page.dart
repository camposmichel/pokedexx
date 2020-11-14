import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedexx/app/modules/info/info_module.dart';
import 'package:pokedexx/app/modules/list/list_module.dart';
import 'package:pokedexx/app/modules/search/search_module.dart';
import 'navigation_controller.dart';

class NavigationPage extends StatefulWidget {
  final String title;
  const NavigationPage({Key key, this.title = "Navigation"}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState
    extends ModularState<NavigationPage, NavigationController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: [
          RouterOutlet(module: ListModule()),
          RouterOutlet(module: SearchModule()),
          RouterOutlet(module: InfoModule()),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: controller.pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              backgroundColor: Colors.blueAccent,
              selectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lista'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Busca'),
                BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
              ],
              currentIndex: controller.pageViewController?.page?.round() ?? 0,
              onTap: (index) {
                controller.pageViewController.jumpToPage(index);
              },
            );
          }),
    );
  }
}
