import 'package:dio/dio.dart';
import 'repositories/pokemon_repository.dart';
import 'stores/pokemon_store.dart';
import 'package:pokedexx/app/modules/navigation/navigation_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pokedexx/app/app_widget.dart';

import 'utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => PokemonStore(i.get())),
        Bind((i) => PokemonRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: NavigationModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
