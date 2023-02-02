import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/pokegrid.dart';
import '../models/pokemon_list.dart';

class Pokemon {
  final int id;
  final String name;
  final List<String> types;

  Pokemon({required this.id, required this.name, required this.types});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      types: List<String>.from(json['type']),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              decoration: InputDecoration(
                  label: Text('Procure seu pokémon.'),
                  border: OutlineInputBorder()),
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
                        return Consumer<PokemonList>(
                          builder: (ctx, pokemon, child) => PokeGrid(
                            pokemon: pokemon,
                          ),
                        );
                      }
                    // return _createGifTable(context, snapshot);
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
