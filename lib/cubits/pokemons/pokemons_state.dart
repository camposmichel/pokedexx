part of 'pokemons_cubit.dart';

@immutable
class PokemonsState {
  final int page;
  final List<PokemonMapped> pokemons;

  const PokemonsState({
    required this.pokemons,
    required this.page,
  });

  PokemonsState copyWith({
    required int page,
    required List<PokemonMapped> pokemons,
  }) {
    return PokemonsState(page: page, pokemons: pokemons);
  }
}
