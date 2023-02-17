import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/utils/app_routers.dart';
import 'package:provider/provider.dart';
import '../widgets/poke_widget.dart';

class PokeGridItem extends StatelessWidget {
  const PokeGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<Pokemon>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRouters.POKE_DETAILS, arguments: pokemon);
      },
      child: Card(
        elevation: 1,
        child: Container(
          color: pokemon.types[0].typeBackgroundColor,
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
                  CachedNetworkImage(
                    imageUrl: pokemon.img,
                    height: MediaQuery.of(context).size.height * 0.13,
                  ),
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
                child: PokeWidget.setTypes(pokemon.types),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
