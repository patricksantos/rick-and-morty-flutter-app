import 'package:dartz/dartz.dart';
import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/errors/erros.dart';
import 'package:rickmortyapp/core/repository/i_rick_morty_repository.dart';

class GetEpisode {
  final IRickMortyRepository _repository;

  GetEpisode(this._repository);

  Future<Either<ErrorApi, Episode>> execute(int id) async {
    return await _repository.getEpisode(id);
  }
}
