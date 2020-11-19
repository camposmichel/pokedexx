import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedexx/app/models/pokemon_model.dart';
import 'package:pokedexx/app/repositories/pokemon_repository.dart';

part 'list_controller.g.dart';

@Injectable()
class ListController = _ListControllerBase with _$ListController;

abstract class _ListControllerBase with Store {
  final PokemonRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _ListControllerBase(this.repository) {
    fetchPokemons();
  }

  @action
  void fetchPokemons() {
    pokemons = this.repository.getList().asObservable();
  }
}
