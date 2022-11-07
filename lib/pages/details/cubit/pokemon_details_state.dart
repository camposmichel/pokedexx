part of 'pokemon_details_cubit.dart';

@immutable
class PokemonDetailsState {
  final int currentPageView;
  final List<Pokemonspecies> pokemonSpecies;
  final PokemonMapped? pokemonOnFocus;

  const PokemonDetailsState({
    this.currentPageView = 0,
    this.pokemonSpecies = const [],
    this.pokemonOnFocus,
  });

  PokemonDetailsState copyWith({
    int? currentPageView,
    List<Pokemonspecies>? pokemonSpecies,
    PokemonMapped? pokemonOnFocus,
  }) {
    return PokemonDetailsState(
      currentPageView: currentPageView ?? this.currentPageView,
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
      pokemonOnFocus: pokemonOnFocus ?? this.pokemonOnFocus,
    );
  }
}
