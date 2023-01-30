import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/models/pokemon_list.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map> _getPokedex() async {
    http.Response response;

    response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<PokemonList>(
      context,
      listen: false,
    ).getPokemons();
    _getPokedex().then((value) {});
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
                future: _getPokedex(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Center(
                        child: Container(
                            child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        )),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return _createGifTable(context, snapshot);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: snapshot.data["pokemon"].length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          child: Image.network(snapshot.data["pokemon"][index]["img"]),
        );
      }),
    );
  }
}
