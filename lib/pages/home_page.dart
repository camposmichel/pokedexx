import 'package:flutter/material.dart';
import 'package:pokedexx/ui/theme.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: _handlePokecard,
          ),
        ),
      );

  Widget _handlePokecard(BuildContext _, int index) {
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
          Container(
            width: MediaQuery.of(context).size.width - 120,
            height: 80,
            padding: const EdgeInsets.only(left: 32),
            decoration: const BoxDecoration(
              // color: AppTheme.pkFireColor,
              color: Color.fromARGB(199, 243, 243, 243),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Charmander',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 8,
                      ),
                      margin: EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.pkFireColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        'Fire',
                        style: TextStyle(
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png',
            ),
            // child: FadeInImage.assetNetwork(
            //   placeholder: 'assets/images/pokemongo.gif',
            //   image:
            //       'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png',
            // ),
            // child: Image.network(
            //     'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _handleAppBar(),
      // body: SafeArea(child: _handleBody()),
      body: _handleBody(),
    );
  }
}
