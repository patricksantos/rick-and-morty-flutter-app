import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/facade/i_rick_morty_repository.dart';

class GetEpisode {
  final IRickMortyRepository _repository;

  GetEpisode(this._repository);

  Future<Episode> execute(int id) async {
    return await _repository.getEpisode(id);
  }
}
