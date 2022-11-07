import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedexx/models/get_pk_response_model.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit() : super(const PokemonDetailsState());

  void fetchPokemonSpecies({
    required int currentPageView,
    required List<Pokemonspecies> pokemonSpecies,
    required PokemonMapped pokemonOnFocus,
  }) {
    emit(state.copyWith(
      pokemonSpecies: pokemonSpecies,
      pokemonOnFocus: pokemonOnFocus,
      currentPageView: currentPageView,
    ));
  }

  void fetchViewPage(
    int currentPageView,
    PokemonMapped pokemonOnFocus,
  ) {
    emit(
      state.copyWith(
        currentPageView: currentPageView,
        pokemonOnFocus: pokemonOnFocus,
      ),
    );
  }
}
