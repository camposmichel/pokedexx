part of 'pokemons_cubit.dart';

@immutable
class PokemonsState {
  final int page;
  final List<PokemonMapped> pokemons;
  final PokemonMapped? pokemonSelected;

  const PokemonsState({
    required this.pokemons,
    required this.page,
    this.pokemonSelected,
  });

  PokemonsState copyWith({
    int? page,
    List<PokemonMapped>? pokemons,
    PokemonMapped? pokemonSelected,
  }) {
    return PokemonsState(
      page: page ?? this.page,
      pokemons: pokemons ?? this.pokemons,
      pokemonSelected: pokemonSelected,
    );
  }
}
