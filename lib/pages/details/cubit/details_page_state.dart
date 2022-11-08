part of 'details_page_cubit.dart';

@immutable
class DetailsPageState {
  final int currentPageView;
  final List<Pokemonspecies> pokemonSpecies;
  final PokemonMapped? pokemonOnFocus;

  const DetailsPageState({
    this.currentPageView = 0,
    this.pokemonSpecies = const [],
    this.pokemonOnFocus,
  });

  DetailsPageState copyWith({
    int? currentPageView,
    List<Pokemonspecies>? pokemonSpecies,
    PokemonMapped? pokemonOnFocus,
  }) {
    return DetailsPageState(
      currentPageView: currentPageView ?? this.currentPageView,
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
      pokemonOnFocus: pokemonOnFocus ?? this.pokemonOnFocus,
    );
  }
}
