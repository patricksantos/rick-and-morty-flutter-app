import 'package:rickmortyapp/core/entity/character.dart';

class Episode {
  final int _id;
  final String _name;
  final String _episode;
  final List<Character> _characters;
  final DateTime _air_date;

  Episode(
    this._id,
    this._name,
    this._episode,
    this._air_date,
    this._characters,
  );

  int get id => _id;
  String get name => _name;
  String get episode => _episode;
  List<Character> get characters => _characters;
  DateTime get date => _air_date;
}
