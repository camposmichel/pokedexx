import 'package:pokedexx/models/get_pk_response_model.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';
import 'package:pokedexx/services/graphql_service.dart';

class PokemonRepository {
  final GraphQLService service;

  PokemonRepository({
    required this.service,
  });

  Future<List<PokemonMapped>> getPokemonList(int page) async {
    const String query = r'''
          query getPokemons($offset: Int!) {
            pokemons: pokemon_v2_pokemon(offset: $offset, limit: 6, order_by: {id: asc}) {
              id
              name
              height
              is_default
              base_experience
              sprites: pokemon_v2_pokemonsprites {
                id
              }
              types: pokemon_v2_pokemontypes {
                type: pokemon_v2_type {
                  id
                  name
                }
                slot
              }
            }
            species: pokemon_v2_pokemonspecies(offset: $offset, limit: 6, order_by: {id: asc}) {
              id
              evolutionchain: pokemon_v2_evolutionchain {
                id
                pokemonspecies: pokemon_v2_pokemonspecies {
                  name
                  id
                  order
                  pokemon_color_id
                }
              }
            }
          }
        ''';
    final variables = <String, dynamic>{'offset': page * 6};
    final response = await service.performQuery(query, variables: variables);
    final responseModel = GetPokemonResponseModel.fromJson(response.data!);

    final List<PokemonMapped> pokemonsMapped = responseModel.pokemons!
        .map((model) => _handlePokemonsMapped(
              model,
              responseModel.species,
            ))
        .toList();
    return pokemonsMapped;
  }

  PokemonMapped _handlePokemonsMapped(Pokemons model, List<Species>? species) {
    final pokemonSpecies =
        species?.firstWhere((element) => element.id == model.id);
    return PokemonMapped.responseModel(model: model, species: pokemonSpecies);
  }
}
