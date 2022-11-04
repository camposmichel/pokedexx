import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';
import 'package:pokedexx/ui/theme.dart';

class PokeCardWidget extends StatelessWidget {
  final PokemonMapped pokemon;
  const PokeCardWidget({super.key, required this.pokemon});

  _handleTypes(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width - 180,
        height: 22,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: pokemon.types!.length,
          itemBuilder: (_, index) {
            final typeSlot = pokemon.types![index];

            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              margin: const EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                color: AppTheme.getPkColorByType(typeSlot.type!.name ?? ''),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Text(
                typeSlot.type!.name ?? '',
                style: const TextStyle(
                  letterSpacing: 1.8,
                ),
              ),
            );
          },
        ),
      );

  _handleInfoContainer(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width - 120,
        height: 80,
        padding: const EdgeInsets.only(left: 32),
        decoration: const BoxDecoration(
          color: Color.fromARGB(199, 243, 243, 243),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.name ?? 'error',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            _handleTypes(context),
          ],
        ),
      );

  _handleImage() => Align(
        alignment: Alignment.bottomRight,
        child: SvgPicture.network(
          pokemon.image1 ?? '',
          height: 120,
          placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      // margin: const EdgeInsets.only(bottom: 8),
      // color: Colors.black12,
      // decoration: const BoxDecoration(
      //   color: Colors.blueGrey,
      //   borderRadius: BorderRadius.all(Radius.circular(18)),
      // ),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          _handleInfoContainer(context),
          _handleImage(),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: FadeInImage.memoryNetwork(
          //     placeholder: kTransparentImage,
          //     image: pokemon.sprites.first
          //         'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png',
          //   ),
          // ),
        ],
      ),
    );
  }
}
