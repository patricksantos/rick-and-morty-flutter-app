class Character {
  final int _id;
  final String _name;
  final String _status;
  final String _species;
  final String _gender;
  final String _origin;
  final String _location;
  final String _image;

  Character(
    this._id,
    this._name,
    this._status,
    this._species,
    this._gender,
    this._origin,
    this._location,
    this._image,
  );

  int get id => _id;
  String get name => _name;
  String get status => _status;
  String get species => _species;
  String get gender => _gender;
  String get origin => _origin;
  String get location => _location;
  String get image => _image;
}
