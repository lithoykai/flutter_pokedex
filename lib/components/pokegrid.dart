import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/poke_item.dart';
import 'package:provider/provider.dart';
import '../models/pokemon.dart';

// ignore: must_be_immutable
class PokeGrid extends StatelessWidget {
  List<Pokemon> pokemon;
  PokeGrid({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String? valueText;
    // final pokemon = Provider.of<PokemonList>(context);
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 180,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: pokemon.length,
      itemBuilder: ((context, i) => ChangeNotifierProvider.value(
            value: pokemon[i],
            child: PokeGridItem(),
          )),
    );
  }
}
