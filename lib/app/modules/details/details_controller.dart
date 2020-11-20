import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:pokedexx/app/stores/pokemon_store.dart';

part 'details_controller.g.dart';

@Injectable()
class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  PokemonStore pokemonStore;

  _DetailsControllerBase({
    this.pokemonStore,
  });
}
