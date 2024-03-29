import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';

class PokeImageWidget extends StatelessWidget {
  final PokemonMapped pokemon;
  final double height;
  final AlignmentGeometry alignment;

  const PokeImageWidget({
    super.key,
    required this.pokemon,
    required this.height,
    this.alignment = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = pokemon.id! > 649
        ? Image.network(
            pokemon.image2 ?? '',
            height: height,
            // cacheHeight: height.toInt(),
          )
        : SvgPicture.network(
            pokemon.image1 ?? '',
            height: height,
            placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator(),
            ),
          );
    return Align(
      alignment: alignment,
      child: Hero(
        tag: pokemon.name!,
        child: pokemon.id! > 905
            ? Image.asset(
                'assets/images/pokeball.png',
                height: height,
              )
            : child,
      ),
    );
  }
}
