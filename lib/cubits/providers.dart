import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedexx/cubits/pokemons/pokemons_cubit.dart';
import 'package:pokedexx/repositories/pokemon_repository.dart';
import 'package:pokedexx/services/graphql_service.dart';

class CubitProviders {
  static final graphQLService =
      GraphQLService('https://beta.pokeapi.co/graphql/v1beta');
  static final _pokemonRepository = PokemonRepository(service: graphQLService);
  static final List<BlocProvider> providers = [
    BlocProvider<PokemonsCubit>(
      create: (_) => PokemonsCubit(repository: _pokemonRepository),
    ),
  ];
}
