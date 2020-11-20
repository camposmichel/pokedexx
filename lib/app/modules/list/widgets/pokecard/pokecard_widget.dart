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
        padding: EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          leading: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: '$URL_SPRITE_BASE/${pokemon.id}.png',
          ),
          title: Text(
            this.pokemon.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            '#${this.pokemon.id}',
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            Modular.to.pushNamed('/details/${pokemon.id}');
          },
        ));
  }
}
