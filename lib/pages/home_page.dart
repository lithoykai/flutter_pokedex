import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/pokegrid.dart';
import '../models/pokemon.dart';
import '../models/pokemon_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _findPokemon = '';
  @override
  void initState() {
    super.initState();
    Provider.of<PokemonList>(context, listen: false).fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          child: Image.network(
            'https://user-images.githubusercontent.com/29473781/180619084-a56960ab-7efa-4e34-9d33-4e3e581d62ff.png',
            fit: BoxFit.contain,
            width: 150,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  label: Text('Procure seu pokémon.'),
                  border: OutlineInputBorder()),
              onChanged: (value) => setState(() {
                _findPokemon = value;
              }),
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<PokemonList>(
                  context,
                  listen: false,
                ).fetchPokemons(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Ocorreu um erro!'),
                        );
                      } else {
                        final List<Pokemon> _pokemons =
                            Provider.of<PokemonList>(context).pokemons;
                        return PokeGrid(
                          pokemon: _pokemons
                              .where((pokemon) => pokemon.name
                                  .toLowerCase()
                                  .contains(_findPokemon.toLowerCase()))
                              .toList(),
                        );
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
