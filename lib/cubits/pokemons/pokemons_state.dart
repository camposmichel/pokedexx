part of 'pokemons_cubit.dart';

@immutable
class PokemonsState {
  final List<PokemonMapped> pokemons;

  const PokemonsState({
    required this.pokemons,
  });

  PokemonsState copyWith({required List<PokemonMapped> pokemons}) {
    return PokemonsState(pokemons: pokemons);
  }
}
