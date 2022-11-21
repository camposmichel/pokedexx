import 'package:flutter/material.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';
import 'package:pokedexx/ui/theme.dart';
import 'package:pokedexx/ui/widgets/pokeimage_widget.dart';
import 'package:pokedexx/ui/widgets/poketypes_widget.dart';

class PokeCardWidget extends StatelessWidget {
  final PokemonMapped pokemon;
  final Function()? onTap;
  const PokeCardWidget({
    super.key,
    required this.pokemon,
    this.onTap,
  });

  _handleInfoContainer(BuildContext context) {
    double contentWidth = 120;
    double contentHeight = 80;
    double contentBorder = 6;
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8));

    return Container(
      width: MediaQuery.of(context).size.width - contentWidth + contentBorder,
      height: contentHeight + contentBorder,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppTheme.getTypesColors(pokemon),
        ),
        borderRadius: borderRadius,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - contentWidth,
        height: contentHeight,
        padding: const EdgeInsets.only(left: 24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(199, 243, 243, 243),
          borderRadius: borderRadius,
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
            PokeTypesWidget(types: pokemon.types ?? []),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 120,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            _handleInfoContainer(context),
            PokeImageWidget(
              pokemon: pokemon,
              height: 108,
            ),
          ],
        ),
      ),
    );
  }
}
