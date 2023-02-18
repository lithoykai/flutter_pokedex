import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/models/pokemon_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fetchPokemons should return me a list of Pokemons.', () async {
    final pokemonList = PokemonList();
    await pokemonList.fetchPokemons();

    expect(pokemonList.pokemons.isNotEmpty, true);
    expect(pokemonList.pokemons[0], isA<Pokemon>());
  });
  test('fetchPokemons should return Pikachu as 25th pokemon.', () async {
    final pokemonList = PokemonList();
    await pokemonList.fetchPokemons();

    expect(pokemonList.pokemons.isNotEmpty, true);
    expect(pokemonList.pokemons[24].name, 'Pikachu');
  });
}
