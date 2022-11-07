import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';

class PokeImageWidget extends StatelessWidget {
  final PokemonMapped pokemon;
  final double height;

  const PokeImageWidget({
    super.key,
    required this.pokemon,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = pokemon.id! > 649
        ? Image.network(
            pokemon.image2 ?? '',
            height: height,
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
      alignment: Alignment.bottomRight,
      child: Hero(
        tag: pokemon.name!,
        child: pokemon.id! > 905
            ? Image.network(
                'https://tr.rbxcdn.com/b803b11a5ecedb39bfe37edc8bbb7528/420/420/Image/Png',
                height: height,
              )
            : child,
      ),
    );
  }
}
