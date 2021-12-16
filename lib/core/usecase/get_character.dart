import 'package:dartz/dartz.dart';
import 'package:rickmortyapp/core/entity/character.dart';
import 'package:rickmortyapp/core/errors/erros.dart';
import 'package:rickmortyapp/core/repository/i_rick_morty_repository.dart';

class GetCharacter {
  final IRickMortyRepository _repository;

  GetCharacter(this._repository);

  Future<Either<ErrorApi, Character>> execute(String url) async {
    return await _repository.getCharacter(url);
  }

  Future<Either<ErrorApi, List<Character>>> getAllCharacters(
      List<String> urls) async {
    List<Character> listCharacters = <Character>[];
    for (var url in urls) {
      var character = await _repository.getCharacter(url);
      character.fold(
        (l) => left(l),
        (r) => listCharacters.add(r),
      );
    }
    return right(listCharacters);
  }
}
