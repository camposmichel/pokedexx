import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexx/cubits/pokemons/pokemons_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonsCubit, PokemonsState>(
        builder: (_, state) {
          if (state.pokemonSelected == null) {
            return Center(
              child: Text('Aguarde...'),
            );
          }
          return Center(
            child: Hero(
              tag: state.pokemonSelected!.name!,
              child: SvgPicture.network(
                state.pokemonSelected!.image1 ?? '',
                height: 108,
                placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
