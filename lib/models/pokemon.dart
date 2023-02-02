import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String name;
  final String img;
  final List<String> weaknesses;
  final List<Evolution>? nextEvolution;
  final List<Evolution>? prevEvolution;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.img,
    required this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
    required this.types,
  });

  Color? get typeBackgroundColor {
    switch (types.first) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Color.fromARGB(255, 247, 191, 187);
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      types: List<String>.from(json['type']),
      weaknesses: List<String>.from(json['weaknesses']),
      nextEvolution: json['next_evolution'] != null
          ? (json['next_evolution'] as List)
              .map((e) => Evolution.fromJson(e))
              .toList()
          : [],
      prevEvolution: json['prev_evolution'] != null
          ? (json['prev_evolution'] as List)
              .map((e) => Evolution.fromJson(e))
              .toList()
          : [],
    );
  }
}

class Evolution {
  final String? name;
  final String? type;

  Evolution({
    this.name,
    this.type,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      name: json['name'],
      type: json['type'],
    );
  }
}
