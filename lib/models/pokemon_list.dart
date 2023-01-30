import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonList with ChangeNotifier {
  List<Pokemon> _items = [];
  List<Pokemon> get items => [..._items];

  Future<void> getPokemons() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));

    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> dataPokemon = data["pokemon"];
    dataPokemon.forEach((pokemonData) {
      _items.add(Pokemon(
        id: pokemonData['id'],
        name: pokemonData['name'],
        img: pokemonData['img'],
        candy: pokemonData['candy'],
        // weaknesses: pokemonData['weaknesses'],
        // type: pokemonData['type']),
      ));
    });
    notifyListeners();
  }

  int get itemsCount {
    return _items.length;
  }
}
