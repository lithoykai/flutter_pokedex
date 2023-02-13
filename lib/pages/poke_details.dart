import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widgets/poke_widget.dart';
import '../models/pokemon.dart';

class PokeDetails extends StatelessWidget {
  PokeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Container(
            child: Image.network(
              'https://user-images.githubusercontent.com/29473781/180619084-a56960ab-7efa-4e34-9d33-4e3e581d62ff.png',
              fit: BoxFit.contain,
              width: 90,
            ),
          ),
          elevation: 0,
          backgroundColor: pokemon.types[0].typeBackgroundColor,
          toolbarHeight: 40,
          // title: Text(pokemon.name),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.28,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: pokemon.types[0].typeBackgroundColor,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(45))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img,
                      fit: BoxFit.contain,
                      width: constraints.maxWidth * 0.40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.085,
                          fontFamily: "Pokemon_Classic",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: PokeWidget.setTypes(pokemon.types),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Fraqueza:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Pokemon_Classic",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PokeWidget.setWeaknesses(pokemon.weaknesses),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Evoluções:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Pokemon_Classic",
                      ),
                    ),
                    Column(
                      children: [
                        Column(
                          children: PokeWidget.getEvolutionImage(pokemon),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
