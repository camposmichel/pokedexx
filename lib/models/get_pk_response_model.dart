import 'package:pokedexx/models/pokemon_mapped_model.dart';

class GetPokemonResponseModel {
  List<Pokemons>? pokemons;
  List<Species>? species;

  GetPokemonResponseModel({this.pokemons, this.species});

  GetPokemonResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemons'] != null) {
      pokemons = <Pokemons>[];
      json['pokemons'].forEach((v) {
        pokemons!.add(Pokemons.fromJson(v));
      });
    }
    if (json['species'] != null) {
      species = <Species>[];
      json['species'].forEach((v) {
        species!.add(Species.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pokemons != null) {
      data['pokemons'] = pokemons!.map((v) => v.toJson()).toList();
    }
    if (species != null) {
      data['species'] = species!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemons {
  int? id;
  String? name;
  int? height;
  bool? isDefault;
  int? baseExperience;
  List<Sprites>? sprites;
  List<Types>? types;

  Pokemons(
      {this.id,
      this.name,
      this.height,
      this.isDefault,
      this.baseExperience,
      this.sprites,
      this.types});

  Pokemons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    height = json['height'];
    isDefault = json['is_default'];
    baseExperience = json['base_experience'];
    if (json['sprites'] != null) {
      sprites = <Sprites>[];
      json['sprites'].forEach((v) {
        sprites!.add(Sprites.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['height'] = height;
    data['is_default'] = isDefault;
    data['base_experience'] = baseExperience;
    if (sprites != null) {
      data['sprites'] = sprites!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sprites {
  int? id;

  Sprites({this.id});

  Sprites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Types {
  Type? type;
  int? slot;

  Types({this.type, this.slot});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type!.toJson();
    }
    data['slot'] = slot;
    return data;
  }
}

class Type {
  int? id;
  String? name;
  String? icon;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = 'https://pokedex-react-mui.netlify.app/${json['name']}.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Species {
  int? id;
  Evolutionchain? evolutionchain;

  Species({this.id, this.evolutionchain});

  Species.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    evolutionchain = json['evolutionchain'] != null
        ? Evolutionchain.fromJson(json['evolutionchain'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (evolutionchain != null) {
      data['evolutionchain'] = evolutionchain!.toJson();
    }
    return data;
  }
}

class Evolutionchain {
  int? id;
  List<Pokemonspecies>? pokemonspecies;

  Evolutionchain({this.id, this.pokemonspecies});

  Evolutionchain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['pokemonspecies'] != null) {
      pokemonspecies = <Pokemonspecies>[];
      json['pokemonspecies'].forEach((v) {
        pokemonspecies!.add(Pokemonspecies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (pokemonspecies != null) {
      data['pokemonspecies'] = pokemonspecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemonspecies {
  String? name;
  int? id;
  List<Pokemons>? infos;
  PokemonMapped? pokeInfo;

  Pokemonspecies({this.name, this.id, this.infos, this.pokeInfo});

  Pokemonspecies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['infos'] != null) {
      infos = <Pokemons>[];
      json['infos'].forEach((v) {
        infos!.add(Pokemons.fromJson(v));
      });
      if (json['infos'].first != null) {
        pokeInfo = PokemonMapped.fromJson(json['infos'].first);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    if (infos != null) {
      data['infos'] = infos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
