import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pokedexx/app/models/pokemon_model.dart';
import 'package:pokedexx/app/utils/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class PokecardWidget extends StatelessWidget {
  final PokemonModel pokemon;
  const PokecardWidget({
    Key key,
    this.pokemon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/details/${pokemon.id}');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: '$URL_SPRITE_BASE/${pokemon.id}.png',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '#${this.pokemon.id} ',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    this.pokemon.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
