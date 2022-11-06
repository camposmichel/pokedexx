class PokemonQueries {
  PokemonQueries._();

  static const String getPokemons = r'''
          query getPokemons($offset: Int!, $limit: Int!) {
            pokemons: pokemon_v2_pokemon(offset: $offset, limit: $limit, order_by: {id: asc}) {
              id
              name
              height
              is_default
              base_experience
              types: pokemon_v2_pokemontypes {
                type: pokemon_v2_type {
                  id
                  name
                }
                slot
              }
            }
            species: pokemon_v2_pokemonspecies(offset: $offset, limit: $limit, order_by: {id: asc}) {
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

  static const String getPokemons2 = r'''
          query getPokemons($offset: Int!, $limit: Int!) {
            pokemons: pokemon_v2_pokemon(offset: $offset, limit: $limit, order_by: {id: asc}) {
              id
              name
              height
              is_default
              base_experience
              types: pokemon_v2_pokemontypes {
                type: pokemon_v2_type {
                  id
                  name
                }
                slot
              }
            }
            species: pokemon_v2_pokemonspecies(offset: $offset, limit: $limit, order_by: {id: asc}) {
              id
              evolutionchain: pokemon_v2_evolutionchain {
                id
                pokemonspecies: pokemon_v2_pokemonspecies {
                  name
                  id
                  infos: pokemon_v2_pokemons(limit: 1) {
                    id
                    name
                    height
                    is_default
                    base_experience
                    types: pokemon_v2_pokemontypes {
                      type: pokemon_v2_type {
                        id
                        name
                      }
                      slot
                    }
                  }
                }
              }
            }
          }
        ''';
}
