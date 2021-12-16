import 'package:rickmortyapp/core/entity/character.dart';

class CharacterAdapter {
  static Character create(Map<String, dynamic> json) {
    Character character = Character(
      int.parse(json['id'].toString()),
      json['name'],
      json['status'],
      json['species'],
      json['gender'],
      json['origin']["name"],
      json['location']["name"],
      json['image'],
    );

    return character;
  }
}
