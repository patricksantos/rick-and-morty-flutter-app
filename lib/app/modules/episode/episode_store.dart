import 'package:mobx/mobx.dart';
import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/repository/i_rick_morty_repository.dart';
import 'package:rickmortyapp/core/usecase/get_episode.dart';

part 'episode_store.g.dart';

class EpisodeStore = _EpisodeStoreBase with _$EpisodeStore;

abstract class _EpisodeStoreBase with Store {
  final IRickMortyRepository _repository;
  GetEpisode? _getEpisode;

  _EpisodeStoreBase(this._repository) {
    _getEpisode = GetEpisode(_repository);
  }

  @observable
  Episode? episode;

  @action
  Future<void> getEpisode(int id) async {
    var episodeData = await _getEpisode!.execute(id);
    episodeData.fold((l) => throw l, (r) => episode = r);
  }
}
