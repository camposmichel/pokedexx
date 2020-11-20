import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedexx/app/stores/pokemon_store.dart';
part 'list_controller.g.dart';

@Injectable()
class ListController = _ListControllerBase with _$ListController;

abstract class _ListControllerBase with Store {
  PokemonStore pokemonStore;
  ScrollController scrollController = new ScrollController();

  _ListControllerBase({this.pokemonStore});

  buildScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        pokemonStore.fetchPokemons();
      }
    });
  }
}
