import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';
import 'package:pokedexx/repositories/pokemon_repository.dart';

part 'pokemons_state.dart';

class PokemonsCubit extends Cubit<PokemonsState> {
  final PokemonRepository repository;

  PokemonsCubit({
    required this.repository,
  }) : super(const PokemonsState(
          pokemons: [],
          page: 0,
        ));

  getPokemonList() async {
    try {
      final listReponse = await repository.getPokemonList(state.page);
      emit(state.copyWith(
        pokemons: List.from(state.pokemons)..addAll(listReponse),
        page: state.page + 1,
      ));
    } catch (e) {
      print(e);
    }
  }
}
