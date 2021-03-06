// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PokemonStore = BindInject(
  (i) => PokemonStore(i<PokemonRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonStore on _PokemonStoreBase, Store {
  final _$pokemonsAtom = Atom(name: '_PokemonStoreBase.pokemons');

  @override
  List<PokemonModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<PokemonModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$pokemonDetailsAtom = Atom(name: '_PokemonStoreBase.pokemonDetails');

  @override
  ObservableFuture<PokemonDetailsModel> get pokemonDetails {
    _$pokemonDetailsAtom.reportRead();
    return super.pokemonDetails;
  }

  @override
  set pokemonDetails(ObservableFuture<PokemonDetailsModel> value) {
    _$pokemonDetailsAtom.reportWrite(value, super.pokemonDetails, () {
      super.pokemonDetails = value;
    });
  }

  final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase');

  @override
  void fetchPokemons() {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.fetchPokemons');
    try {
      return super.fetchPokemons();
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchPokemonDetails(String id) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.fetchPokemonDetails');
    try {
      return super.fetchPokemonDetails(id);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
pokemonDetails: ${pokemonDetails}
    ''';
  }
}
