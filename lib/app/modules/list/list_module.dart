import 'list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'list_page.dart';

class ListModule extends ChildModule {
  @override
  List<Bind> get binds => [$ListController];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ListPage()),
      ];

  static Inject get to => Inject<ListModule>.of();
}
