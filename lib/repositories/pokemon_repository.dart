import 'package:pokedexx/models/get_pk_response_model.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';
import 'package:pokedexx/repositories/pokemon_queries.dart';
import 'package:pokedexx/services/graphql_service.dart';

class PokemonRepository {
  final GraphQLService service;

  PokemonRepository({
    required this.service,
  });

  Future<List<PokemonMapped>> getPokemonList(int page) async {
    const double limit = 10;
    final variables = <String, dynamic>{'offset': page * limit, 'limit': limit};
    final response = await service.performQuery(
      PokemonQueries.getPokemons2,
      variables: variables,
    );
    final responseModel = GetPokemonResponseModel.fromJson(response.data!);

    final List<PokemonMapped> pokemonsMapped = responseModel.pokemons!
        .map(
          (model) => _handlePokemonsMapped(
            model,
            responseModel.species,
          ),
        )
        .toList();
    return pokemonsMapped;
  }

  PokemonMapped _handlePokemonsMapped(Pokemons model, List<Species>? species) {
    final pokemonSpecies =
        species?.firstWhere((element) => element.id == model.id);
    return PokemonMapped.responseModel(model: model, species: pokemonSpecies);
  }
}
