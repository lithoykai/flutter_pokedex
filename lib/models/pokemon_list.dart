import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/const/constants.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonList with ChangeNotifier {
  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons => [..._pokemons];

  Future<void> fetchPokemons() async {
    final response = await http.get(Uri.parse(Constants.poke_api_url));

    if (response.statusCode == 200) {
      // Decode the JSON list into a List<Pokemon> object.
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      List<dynamic> pokemonsJson = jsonMap['pokemon'];
      List<Pokemon> pokemonsList =
          pokemonsJson.map((p) => Pokemon.fromJson(p)).toList();
      _pokemons = pokemonsList;
    } else {
      throw Exception('Falha em carrega a lista de Pokemons.');
    }

    notifyListeners();
  }

  void filtered(String value) {
    List<Pokemon> _listTemp = [];
    if (value.isNotEmpty) {
      _listTemp = _pokemons
          .where((pokemon) =>
              pokemon.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    _pokemons = _listTemp;
    notifyListeners();
  }

  int get itemsCount {
    return _pokemons.length;
  }
}
