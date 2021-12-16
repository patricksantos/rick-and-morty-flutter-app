import 'package:mobx/mobx.dart';
import 'package:rickmortyapp/core/entity/character.dart';
import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/repository/i_rick_morty_repository.dart';
import 'package:rickmortyapp/core/usecase/get_character.dart';
import 'package:rickmortyapp/core/usecase/get_episode.dart';

part 'episode_store.g.dart';

class EpisodeStore = _EpisodeStoreBase with _$EpisodeStore;

abstract class _EpisodeStoreBase with Store {
  final IRickMortyRepository _repository;
  GetEpisode? _getEpisode;
  GetCharacter? _getCharacter;

  _EpisodeStoreBase(this._repository) {
    _getEpisode = GetEpisode(_repository);
    _getCharacter = GetCharacter(_repository);
  }

  @observable
  Episode? episode;
  @observable
  List<Character> characters = <Character>[].asObservable();

  @action
  Future<void> getEpisode(int id) async {
    var episodeData = await _getEpisode!.execute(id);
    episodeData.fold((l) {
      getEpisode(id);
      throw l;
    }, (r) {
      episode = r;
      _getAllCharacters(r.characters);
    });
  }

  @action
  Future<void> _getAllCharacters(List<String> urls) async {
    var charactersData = await _getCharacter!.getAllCharacters(urls);
    charactersData.fold((l) => throw l, (r) {
      characters.clear();
      characters.addAll(r);
    });
  }

  @action
  Future<void> _character(String url) async {
    var charactersData = await _getCharacter!.execute(url);
    charactersData.fold((l) => throw l, (r) {
      characters.clear();
      characters.add(r);
    });
  }
}
