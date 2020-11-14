import 'navigation_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'navigation_page.dart';

class NavigationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $NavigationController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => NavigationPage()),
      ];

  static Inject get to => Inject<NavigationModule>.of();
}
