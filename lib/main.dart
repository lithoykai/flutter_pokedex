import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_list.dart';
import 'package:flutter_pokedex/utils/app_routers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pokedex/pages/home_page.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonList(),
        ),
      ],
      child: MaterialApp(color: Colors.white, title: 'Pokedex', routes: {
        AppRouters.HOME_PAGE: (ctx) => HomePage(),
      }),
    );
  }
}
