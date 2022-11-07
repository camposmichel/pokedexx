import 'package:flutter/material.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';

class AppTheme {
  AppTheme._();

  static const pkNormalColor = Color(0xFFA8A77A);
  static const pkFireColor = Color(0xFFEE8130);
  static const pkWaterColor = Color(0xFF6390F0);
  static const pkElectricColor = Color(0xFFF7D02C);
  static const pkGrassColor = Color(0xFF7AC74C);
  static const pkIceColor = Color(0xFF96D9D6);
  static const pkFightingColor = Color(0xFFC22E28);
  static const pkPoisonColor = Color(0xFFA33EA1);
  static const pkGroundColor = Color(0xFFE2BF65);
  static const pkFlyingColor = Color(0xFFA98FF3);
  static const pkPsychicColor = Color(0xFFF95587);
  static const pkBugColor = Color(0xFFA6B91A);
  static const pkRockColor = Color(0xFFB6A136);
  static const pkGhostColor = Color(0xFF735797);
  static const pkDragonColor = Color(0xFF6F35FC);
  static const pkDarkColor = Color(0xFF705746);
  static const pkSteelColor = Color(0xFFB7B7CE);
  static const pkFairyColor = Color(0xFFD685AD);

  static const pkUnknownColor = Color(0xFFa0a29f);
  static const pkShadowColor = Color(0xFFa0a29f);

  static Color getPkColorByType(String type) {
    switch (type) {
      case 'normal':
        return pkNormalColor;
      case 'fighting':
        return pkFightingColor;
      case 'flying':
        return pkFlyingColor;
      case 'poison':
        return pkPoisonColor;
      case 'ground':
        return pkGroundColor;
      case 'rock':
        return pkRockColor;
      case 'bug':
        return pkBugColor;
      case 'ghost':
        return pkGhostColor;
      case 'steel':
        return pkSteelColor;
      case 'fire':
        return pkFireColor;
      case 'water':
        return pkWaterColor;
      case 'grass':
        return pkGrassColor;
      case 'electric':
        return pkElectricColor;
      case 'psychic':
        return pkPsychicColor;
      case 'ice':
        return pkIceColor;
      case 'dragon':
        return pkDragonColor;
      case 'dark':
        return pkDarkColor;
      case 'fairy':
        return pkFairyColor;
      case 'unknown':
        return pkUnknownColor;
      case 'shadow':
        return pkShadowColor;
      default:
        return pkNormalColor;
    }
  }

  static List<Color> getTypesColors(PokemonMapped pokemon) {
    final List<Color> typesColors = [];

    pokemon.types?.forEach((element) {
      typesColors.add(AppTheme.getPkColorByType(element.type!.name!));
    });
    if (typesColors.length == 1) {
      typesColors.add(typesColors.first);
    }

    return typesColors;
  }
}
