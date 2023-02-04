import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:provider/provider.dart';

import '../const/constants.dart';
import '../models/pokemon_list.dart';

class PokeGridItem extends StatelessWidget {
  const PokeGridItem({super.key});

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
    final pokemon = Provider.of<Pokemon>(context);
    return GestureDetector(
      child: Card(
        elevation: 1,
        child: Container(
          color: pokemon.typeBackgroundColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 90,
                    width: 90,
                    child: Image.asset(
                      'assets/img/pokeball.png',
                      color: Colors.grey,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      opacity: const AlwaysStoppedAnimation(0.3),
                    ),
                  ),
                  CachedNetworkImage(imageUrl: pokemon.img),
                ],
              ),
              Text(
                pokemon.name,
                style: const TextStyle(
                  fontFamily: "Pokemon_Classic",
                  fontSize: 10,
                ),
              ),
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: setTipos(
                  pokemon.types,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
