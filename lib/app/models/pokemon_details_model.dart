import 'package:pokedexx/app/utils/utils.dart';

class PokemonDetailsModel {
  String id;
  String name;
  List<Types> types;

  PokemonDetailsModel({this.id, this.name, this.types});

  PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = capitalize(json['name'].toString());
    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Types {
  Type type;

  Types({this.type});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}

class Type {
  String name;
  String url;

  Type({this.name, this.url});

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
