import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedexx/app/modules/list/widgets/pokecard/pokecard_widget.dart';
import 'package:pokedexx/app/utils/utils.dart';
import 'list_controller.dart';

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({Key key, this.title = "List"}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends ModularState<ListPage, ListController> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final pokemonImage = new Image(
      image: new AssetImage('lib/assets/pokemon.png'), fit: BoxFit.cover);

  @override
  void initState() {
    super.initState();
    controller.buildScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        shadowColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.all(100.0),
          child: pokemonImage,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            tooltip: 'Busca de pokemons',
            onPressed: () {
              showSnackBar(_scaffoldKey, 'Em desenvolvimento!');
            },
          ),
        ],
      ),
      body: Observer(builder: (_) {
        final pokemons = controller.pokemonStore.pokemons;

        // TODO: Repensar loading
        if (pokemons == null) {
          return Center(
            child: CircularProgressIndicator(
              semanticsLabel: 'Carregando',
            ),
          );
        }

        return GridView.builder(
          controller: controller.scrollController,
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            return PokecardWidget(
              pokemon: pokemons[index],
            );
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        );
      }),
    );
  }
}
