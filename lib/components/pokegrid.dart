import 'package:flutter/material.dart';
import 'package:flutter_pokedex/const/constants.dart';
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
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 180,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: pokemon.itemsCount,
      itemBuilder: ((context, i) {
        return GestureDetector(
          child: Card(
            elevation: 1,
            child: Container(
              // color: pokemon.pokemons[i].typeBackgroundColor,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(pokemon.pokemons[i].img),
                  Text(
                    pokemon.pokemons[i].name,
                    style: const TextStyle(
                      fontFamily: "Pokemon_Classic",
                      fontSize: 10,
                    ),
                  ),
                  Card(
                    child: Container(
                      color: Constants.getColorType(
                          types: pokemon.pokemons[i].types),
                      width: 50,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text(
                        pokemon.pokemons[i].types[0],
                        style: const TextStyle(
                          fontFamily: "Pokemon_Classic",
                          fontSize: 6,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
