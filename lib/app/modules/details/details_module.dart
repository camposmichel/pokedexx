import 'details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'details_page.dart';

class DetailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DetailsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/:id',
            child: (_, args) => DetailsPage(id: args.params['id'])),
      ];

  static Inject get to => Inject<DetailsModule>.of();
}
