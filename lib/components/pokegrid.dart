import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_list.dart';

class PokeGrid extends StatelessWidget {
  PokemonList pokemon;
  PokeGrid({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: pokemon.itemsCount,
      itemBuilder: ((context, i) {
        return GestureDetector(
          child: Card(
            elevation: 1,
            child: Column(
              children: [
                Image.network(pokemon.items[i].img),
                Text(
                  pokemon.items[i].name,
                  style: const TextStyle(
                    fontFamily: "Pokemon_Classic",
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
