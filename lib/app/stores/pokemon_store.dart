import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedexx/app/models/pokemon_model.dart';
import 'package:pokedexx/app/repositories/pokemon_repository.dart';

part 'pokemon_store.g.dart';

@Injectable()
class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final PokemonRepository repository;

  @observable
  bool loading = false;

  @observable
  List<PokemonModel> pokemons;

  String next;

  _PokemonStoreBase(this.repository) {
    fetchPokemons();
  }

  @action
  void fetchPokemons() {
    loading = true;
    repository.getPokemons(params: next ?? '').then((value) {
      next = value.next;

      if (pokemons == null) {
        pokemons = value.pokemons;
      } else {
        pokemons = [...pokemons, ...value.pokemons];
      }

      loading = false;
    });
  }
}
