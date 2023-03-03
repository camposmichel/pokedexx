import 'package:pokedexx/models/get_pk_response_model.dart';
import 'package:pokedexx/config/string_extension.dart';

class PokemonMapped {
  int? id;
  String? name;
  int? height;
  bool? isDefault;
  int? baseExperience;
  // List<Sprites>? sprites;
  String? image1;
  String? image2;
  String? image3;
  List<Types>? types;
  Evolutionchain? evolutionchain;

  PokemonMapped(
      {this.id,
      this.name,
      this.height,
      this.isDefault,
      this.baseExperience,
      this.image1,
      this.image2,
      this.image3,
      this.types,
      this.evolutionchain});

  PokemonMapped.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = (json['name'] as String).capitalize();
    height = json['height'];
    isDefault = json['is_default'];
    baseExperience = json['base_experience'];
    image1 =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${json['id']}.svg';
    image2 =
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${json['id']}.png';
    image3 =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${json['id']}.gif';
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    evolutionchain = json['evolutionchain'] != null
        ? Evolutionchain.fromJson(json['evolutionchain'])
        : null;
  }

  factory PokemonMapped.responseModel({
    required Pokemons model,
    Species? species,
  }) {
    return PokemonMapped(
      id: model.id,
      name: model.name!.capitalize(),
      height: model.height,
      isDefault: model.isDefault,
      baseExperience: model.baseExperience,
      image1:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${model.id}.svg',
      image2:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${model.id}.png',
      image3:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${model.id}.gif',
      types: model.types,
      evolutionchain: species?.evolutionchain,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['height'] = height;
    data['is_default'] = isDefault;
    data['base_experience'] = baseExperience;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (evolutionchain != null) {
      data['evolutionchain'] = evolutionchain!.toJson();
    }
    return data;
  }
}
