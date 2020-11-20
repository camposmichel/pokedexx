import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedexx/app/utils/constants.dart';
import 'package:pokedexx/app/utils/utils.dart';
import 'package:transparent_image/transparent_image.dart';
import 'details_controller.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  const DetailsPage({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsController> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    controller.pokemonStore.fetchPokemonDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Detalhes'),
        ),
        body: Observer(builder: (_) {
          if (controller.pokemonStore.pokemonDetails.error != null) {
            showSnackBar(_scaffoldKey, 'Deu ruim!');
            Modular.to.pushNamed(Modular.initialRoute);
          }

          if (controller.pokemonStore.pokemonDetails.value == null) {
            return Center(
              child: CircularProgressIndicator(
                semanticsLabel: 'Carregando',
              ),
            );
          }

          final details = controller.pokemonStore.pokemonDetails.value;
          return Center(
            child: Column(
              children: [
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: '$URL_IMAGE_BASE/${details.id}.png',
                  imageScale: 1.5,
                  fit: BoxFit.contain,
                ),
                Text(
                  details.name,
                  style: TextStyle(fontSize: 25.0),
                )
              ],
            ),
          );
        }));
  }
}
