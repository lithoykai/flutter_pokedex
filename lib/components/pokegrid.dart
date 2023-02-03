import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/const/constants.dart';
import 'package:flutter_pokedex/models/pokemon_list.dart';

// ignore: must_be_immutable
class PokeGrid extends StatelessWidget {
  PokemonList pokemon;
  PokeGrid({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  Widget setTipos(List<String> types) {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Row(
          children: [
            Container(
              color: Constants.getColorType(types: types[0]),
              width: 50,
              height: 25,
              alignment: Alignment.center,
              child: Text(
                nome.trim(),
                style: const TextStyle(
                  fontFamily: "Pokemon_Classic",
                  fontSize: 6,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: lista,
    );
  }

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
              color: pokemon.pokemons[i].typeBackgroundColor,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(imageUrl: pokemon.pokemons[i].img),
                  // Image.network(pokemon.pokemons[i].img),
                  Text(
                    pokemon.pokemons[i].name,
                    style: const TextStyle(
                      fontFamily: "Pokemon_Classic",
                      fontSize: 10,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: setTipos(
                      pokemon.pokemons[i].types,
                    ),
                    // child: Text(
                    //   pokemon.pokemons[i].types[0],
                    //   style: const TextStyle(
                    //     fontFamily: "Pokemon_Classic",
                    //     fontSize: 6,
                    //     color: Colors.white,
                    //   ),
                    // ),
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
