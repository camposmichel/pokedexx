import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedexx/app/modules/list/widgets/pokecard/pokecard_widget.dart';
import 'list_controller.dart';

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({Key key, this.title = "List"}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends ModularState<ListPage, ListController> {
  //use 'controller' variable to access controller
  final pokemonImage = new Image(
      image: new AssetImage('lib/assets/pokemon.png'), fit: BoxFit.cover);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        shadowColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.all(100.0),
          child: pokemonImage,
        ),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return PokecardWidget();
            });
      }),
    );
  }
}
