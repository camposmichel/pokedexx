import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';
import 'package:pokedexx/repositories/pokemon_repository.dart';

part 'pokemons_state.dart';

class PokemonsCubit extends Cubit<PokemonsState> {
  final PokemonRepository repository;

  PokemonsCubit({
    required this.repository,
  }) : super(const PokemonsState(pokemons: []));

  getPokemonList() async {
    try {
      final response = await repository.getPokemonList();
      print(response);
      emit(state.copyWith(pokemons: response));
    } catch (e) {
      print(e);
    }
  }
}
