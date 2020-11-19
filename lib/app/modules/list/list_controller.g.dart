// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListController = BindInject(
  (i) => ListController(i<PokemonRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListController on _ListControllerBase, Store {
  final _$pokemonsAtom = Atom(name: '_ListControllerBase.pokemons');

  @override
  ObservableFuture<List<PokemonModel>> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableFuture<List<PokemonModel>> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$_ListControllerBaseActionController =
      ActionController(name: '_ListControllerBase');

  @override
  void fetchPokemons() {
    final _$actionInfo = _$_ListControllerBaseActionController.startAction(
        name: '_ListControllerBase.fetchPokemons');
    try {
      return super.fetchPokemons();
    } finally {
      _$_ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}
