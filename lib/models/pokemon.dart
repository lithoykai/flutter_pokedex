import 'package:flutter/cupertino.dart';

class Pokemon with ChangeNotifier {
  int id;
  String name;
  String img;
  String candy;
  // List weaknesses;
  // List type;

  Pokemon({
    required this.id,
    required this.name,
    required this.img,
    required this.candy,
    // required this.weaknesses,
    // required this.type,
  });
}
