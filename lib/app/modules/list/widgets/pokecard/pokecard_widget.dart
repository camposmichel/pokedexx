import 'package:flutter/material.dart';

import 'package:pokedexx/app/models/pokemon_model.dart';
import 'package:pokedexx/app/utils/constants.dart';

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
          leading: Image(
            image: NetworkImage(
              '$URL_IMAGE_BASE2/${pokemon.name}.png',
            ),
          ),
          title: Text(
            this.pokemon.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            '#${this.pokemon.id}',
            style: TextStyle(color: Colors.blue),
          ),
        ));
  }
}
