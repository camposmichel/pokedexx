import 'package:flutter/material.dart';

class PokecardWidget extends StatelessWidget {
  final String name;

  const PokecardWidget({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.name),
    );
  }
}
