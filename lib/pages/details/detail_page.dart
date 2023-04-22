import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedexx/cubits/pokemons/pokemons_cubit.dart';
import 'package:pokedexx/models/pokemon_mapped_model.dart';
import 'package:pokedexx/pages/details/cubit/details_page_cubit.dart';
import 'package:pokedexx/ui/theme.dart';
import 'package:pokedexx/ui/widgets/pokeimage_widget.dart';
import 'package:pokedexx/ui/widgets/poketypes_widget.dart';

import '../../models/get_pk_response_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late PageController _pageController;

  final AppBar _appBar = AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
  );

  Widget _handleCarrouselImage(PokemonMapped pokemon) {
    List<Pokemonspecies> pokemonSpecies =
        pokemon.evolutionchain!.pokemonspecies ?? [];
    return AspectRatio(
      aspectRatio: 1,
      child: PageView.builder(
        itemCount: pokemonSpecies.length,
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int value) {
          context
              .read<DetailsPageCubit>()
              .fetchViewPage(value, pokemonSpecies[value].pokeInfo!);
        },
        itemBuilder: (_, index) => AnimatedBuilder(
          animation: _pageController,
          builder: (_, child) => Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 108 * 2,
                height: 108 * 2,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    colors: <Color>[
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
              PokeImageWidget(
                pokemon: pokemonSpecies[index].pokeInfo!,
                height: 108 * 3,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _handlePokemonDetails(PokemonMapped pokemon) {
    final containerHeight = MediaQuery.of(context).size.height / 4;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: containerHeight,
      decoration: const BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PokeTypesWidget(
                types: pokemon.types ?? [],
                // color: Colors.black,
              ),
              Text(
                pokemon.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                _handlePokemonId(pokemon.id ?? 0),
                style: const TextStyle(
                  fontFamily: 'PokemonGb',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Height: ${pokemon.height! / 10}m',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 16),
              Text(
                'Weight: ${pokemon.weight! / 10}kg',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: containerHeight / 2.3,
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Text(
                _handleFlavorText(pokemon.flavorText),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _handleContentBody(PokemonMapped pokemon) {
    context.read<DetailsPageCubit>().fetchPokemonSpecies(
          pokemonOnFocus: pokemon,
          pokemonSpecies: pokemon.evolutionchain!.pokemonspecies!,
          currentPageView: pokemon.evolutionchain!.pokemonspecies!
              .indexWhere((element) => element.id == pokemon.id),
        );
    return BlocBuilder<DetailsPageCubit, DetailsPageState>(
      builder: (_, state) {
        final pokemonOnFocus = state.pokemonOnFocus ?? pokemon;
        _pageController = PageController(
          initialPage: state.currentPageView,
          viewportFraction: 0.8,
        );

        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: _appBar.preferredSize.height * 1.4,
            bottom: 16,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppTheme.getTypesColors(pokemonOnFocus),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: _handleCarrouselImage(pokemon)),
              _handlePokemonDetails(pokemonOnFocus),
            ],
          ),
        );
      },
    );
  }

  Widget _handleLoading() => const Center(child: Text('Aguarde...'));

  String _handlePokemonId(int id) {
    if (id < 10) {
      return '#00$id';
    } else if (id < 100) {
      return '#0$id';
    } else {
      return '#$id';
    }
  }

  String _handleFlavorText(String? flavorText) {
    final a = flavorText == null
        ? ''
        : flavorText.replaceAll('\n', ' ').replaceAll('', ' ');
    return a;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<PokemonsCubit, PokemonsState>(
        builder: (_, state) {
          return state.pokemonSelected == null
              ? _handleLoading()
              : _handleContentBody(state.pokemonSelected!);
        },
      ),
    );
  }
}
