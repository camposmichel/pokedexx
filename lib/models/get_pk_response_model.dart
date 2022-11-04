// class GetPokemonResponseModel {
//   Data? data;

//   GetPokemonResponseModel({this.data});

//   GetPokemonResponseModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

class GetPokemonResponseModel {
  List<Pokemons>? pokemons;
  List<Species>? species;

  GetPokemonResponseModel({this.pokemons, this.species});

  GetPokemonResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemons'] != null) {
      pokemons = <Pokemons>[];
      json['pokemons'].forEach((v) {
        pokemons!.add(new Pokemons.fromJson(v));
      });
    }
    if (json['species'] != null) {
      species = <Species>[];
      json['species'].forEach((v) {
        species!.add(new Species.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemons != null) {
      data['pokemons'] = this.pokemons!.map((v) => v.toJson()).toList();
    }
    if (this.species != null) {
      data['species'] = this.species!.map((v) => v.toJson()).toList();
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
        sprites!.add(new Sprites.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['height'] = this.height;
    data['is_default'] = this.isDefault;
    data['base_experience'] = this.baseExperience;
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Types {
  Type? type;
  int? slot;

  Types({this.type, this.slot});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['slot'] = this.slot;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
        ? new Evolutionchain.fromJson(json['evolutionchain'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.evolutionchain != null) {
      data['evolutionchain'] = this.evolutionchain!.toJson();
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
        pokemonspecies!.add(new Pokemonspecies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.pokemonspecies != null) {
      data['pokemonspecies'] =
          this.pokemonspecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemonspecies {
  String? name;
  int? id;
  int? order;
  int? pokemonColorId;

  Pokemonspecies({this.name, this.id, this.order, this.pokemonColorId});

  Pokemonspecies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    order = json['order'];
    pokemonColorId = json['pokemon_color_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['order'] = this.order;
    data['pokemon_color_id'] = this.pokemonColorId;
    return data;
  }
}
