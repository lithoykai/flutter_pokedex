import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import '../const/constants.dart';
import '../models/pokemon.dart';

class PokeWidget {
  static Widget setWeaknesses(List<String> weaknesses) {
    List<Widget> lista = [];
    weaknesses.forEach((nome) {
      lista.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              color: Constants.getColorType(nome),
              width: 50,
              height: 25,
              alignment: Alignment.center,
              child: Text(
                nome.toString(),
                style: const TextStyle(
                  fontFamily: "Pokemon_Classic",
                  fontSize: 6,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: lista,
    );
  }

  static Widget setTypes(List<PokemonType> types) {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5),
          child: Container(
            color: Constants.getColorType(nome.type),
            width: 50,
            height: 25,
            alignment: Alignment.center,
            child: Text(
              nome.type.toString(),
              style: const TextStyle(
                fontFamily: "Pokemon_Classic",
                fontSize: 6,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: lista,
    );
  }

  static Widget getPokeImage(String id) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: CachedNetworkImage(
              imageUrl:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png"),
        ),
      ],
    );
  }

  static List<Widget> getEvolutionImage(Pokemon pokemon) {
    Widget _arrowIcon = const Icon(Icons.keyboard_arrow_down);
    List<Widget> _listOfEvolutionImage = [];
    String _imageUrl = '';
    if (pokemon.prevEvolution != null) {
      pokemon.prevEvolution!.forEach((f) {
        _imageUrl = int.parse(f.num!).toString();
        _listOfEvolutionImage.add(PokeWidget.getPokeImage(_imageUrl));
        _listOfEvolutionImage.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              f.name!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        _listOfEvolutionImage.add(_arrowIcon);
      });
    }
    _listOfEvolutionImage.add(PokeWidget.getPokeImage(pokemon.id.toString()));
    _listOfEvolutionImage.add(
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          pokemon.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    if (pokemon.nextEvolution != null) {
      _listOfEvolutionImage.add(_arrowIcon);
      pokemon.nextEvolution!.forEach((f) {
        _imageUrl = int.parse(f.num!).toString();
        _listOfEvolutionImage.add(PokeWidget.getPokeImage(_imageUrl));
        _listOfEvolutionImage.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              f.name!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        if (pokemon.nextEvolution!.last.name != f.name) {
          _listOfEvolutionImage.add(_arrowIcon);
        }
      });
    }

    return _listOfEvolutionImage;
  }
}
