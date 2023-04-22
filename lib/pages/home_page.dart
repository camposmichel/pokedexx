import 'package:flutter/material.dart';
import 'package:pokedexx/cubits/pokemons/pokemons_cubit.dart';
import 'package:pokedexx/routes.dart';
import 'package:pokedexx/ui/widgets/pokecard_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PokemonsCubit>().getPokemonList();
    _buildScrollListener();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _buildScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        context.read<PokemonsCubit>().getPokemonList();
      }
    });
  }

  AppBar _handleAppBar() => AppBar(
        centerTitle: true,
        title: const Text(
          'Pokedexx',
          style: TextStyle(
            fontFamily: 'PokemonGb',
            letterSpacing: -2,
          ),
        ),
      );

  Widget _handleBody() => Container(
        color: Colors.black12,
        child: Container(
          margin: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
          ),
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: BlocBuilder<PokemonsCubit, PokemonsState>(
            builder: (context, state) {
              if (state.pokemons.isNotEmpty) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: state.pokemons.length,
                  itemBuilder: (BuildContext _, int index) => PokeCardWidget(
                    pokemon: state.pokemons[index],
                    onTap: () {
                      context
                          .read<PokemonsCubit>()
                          .selectPokemon(state.pokemons[index]);
                      Navigator.pushNamed(context, Routes.detail);
                    },
                  ),
                );
              }

              return const Center(
                child: Text('Aguarde...'),
              );
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _handleAppBar(),
      // body: SafeArea(child: _handleBody()),
      body: _handleBody(),
    );
  }
}
