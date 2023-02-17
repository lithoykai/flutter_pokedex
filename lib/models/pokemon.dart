import 'package:flutter/material.dart';

class Pokemon with ChangeNotifier {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> weaknesses;
  final List<Evolution>? nextEvolution;
  final List<Evolution>? prevEvolution;
  final List<PokemonType> types;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id']}.png",
      types: (json['type'] as List<dynamic>)
          .map((type) => PokemonType(
                type: type,
              ))
          .toList(),
      weaknesses: List<String>.from(json['weaknesses']),
      nextEvolution: json['next_evolution'] != null
          ? (json['next_evolution'] as List)
              .map((e) => Evolution.fromJson(e))
              .toList()
          : null,
      prevEvolution: json['prev_evolution'] != null
          ? (json['prev_evolution'] as List)
              .map((e) => Evolution.fromJson(e))
              .toList()
          : null,
    );
  }
}

class PokemonType {
  final String type;

  PokemonType({required this.type});

  Color? get typeBackgroundColor {
    switch (type) {
      case 'Normal':
        return Color.fromARGB(70, 141, 110, 99);
      case 'Fire':
        return Color.fromARGB(139, 247, 191, 187);
      case 'Water':
        return Color.fromARGB(70, 33, 149, 243);
      case 'Grass':
        return Color.fromARGB(70, 76, 175, 79);
      case 'Electric':
        return Color.fromARGB(70, 255, 193, 7);
      case 'Ice':
        return Color.fromARGB(70, 0, 229, 255);
      case 'Fighting':
        return Color.fromARGB(70, 255, 153, 0);
      case 'Poison':
        return Color.fromARGB(70, 155, 39, 176);
      case 'Ground':
        return Color.fromARGB(70, 255, 184, 77);
      case 'Flying':
        return Color.fromARGB(70, 159, 168, 218);
      case 'Psychic':
        return Color.fromARGB(70, 233, 30, 98);
      case 'Bug':
        return Color.fromARGB(70, 139, 195, 74);
      case 'Rock':
        return Color.fromARGB(70, 158, 158, 158);
      case 'Ghost':
        return Color.fromARGB(70, 92, 107, 192);
      case 'Dark':
        return Color.fromARGB(70, 121, 85, 72);
      case 'Dragon':
        return Color.fromARGB(70, 40, 52, 147);
      case 'Steel':
        return Color.fromARGB(70, 96, 125, 139);
      case 'Fairy':
        return Color.fromARGB(70, 255, 128, 170);
      default:
        return Color.fromARGB(70, 158, 158, 158);
    }
  }
}

class Evolution {
  final String? num;
  final String? name;

  Evolution({
    this.num,
    this.name,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      num: json['num'],
      name: json['name'],
    );
  }
}
