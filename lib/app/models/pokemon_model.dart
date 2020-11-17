import 'dart:convert';
import 'package:flutter/foundation.dart';

class PokemonModel {
  final int count;
  final String next;
  final Previous previous;
  final List<Result> results;

  PokemonModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  PokemonModel copyWith({
    int count,
    String next,
    Previous previous,
    List<Result> results,
  }) {
    return PokemonModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous?.toMap(),
      'results': results?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonModel(
      count: map['count']?.toInt(),
      next: map['next'],
      previous: Previous.fromMap(map['previous']),
      results: List<Result>.from(map['results']?.map((x) => Result.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PokemonModel &&
        o.count == count &&
        o.next == next &&
        o.previous == previous &&
        listEquals(o.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}

class Previous {
  static fromMap(map) {}

  Map<String, dynamic> toMap() {
    return {};
  }
}

class Result {
  final String name;
  final String url;
  Result({
    this.name,
    this.url,
  });

  Result copyWith({
    String name,
    String url,
  }) {
    return Result(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Result(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));

  @override
  String toString() => 'Result(name: $name, url: $url)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Result && o.name == name && o.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
