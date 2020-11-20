class PokemonResponse {
  String next;
  List<PokemonModel> pokemons;

  PokemonResponse({this.next, this.pokemons});

  PokemonResponse.fromJson(Map<String, dynamic> json) {
    next = json['next'].split('pokemon')[1];
    if (json['results'] != null) {
      pokemons = new List<PokemonModel>();
      json['results'].forEach((v) {
        pokemons.add(new PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    if (this.pokemons != null) {
      data['pokemons'] = this.pokemons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonModel {
  String id;
  String name;

  PokemonModel({this.id, this.name});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = _getIdByUrl(json['url']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  String _getIdByUrl(String url) {
    final String preId = url.split('pokemon')[1];
    return preId.substring(1, preId.length - 1);
  }
}
