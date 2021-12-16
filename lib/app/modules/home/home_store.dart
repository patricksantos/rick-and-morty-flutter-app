import 'package:mobx/mobx.dart';
import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/entity/page.dart';
import 'package:rickmortyapp/core/errors/erros.dart';
import 'package:rickmortyapp/core/repository/i_rick_morty_repository.dart';
import 'package:rickmortyapp/core/usecase/all_episodes.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IRickMortyRepository _repository;

  @observable
  AllEpisodes? _allEpisodes;

  HomeStoreBase(this._repository) {
    _allEpisodes = AllEpisodes(_repository);
  }

  @observable
  Page? _page;
  @observable
  List<Episode> episodes = <Episode>[].asObservable();

  bool get isEmptyEpisode => episodes.isEmpty;

  @action
  Future<void> firstPage() async {
    var firstPage = await _allEpisodes!.execute();
    firstPage.fold(
      (l) => throw ErrorApi(l.message),
      (r) {
        episodes.addAll(r.episodes);
        _page = r;
      },
    );
  }

  @action
  Future<void> toUpdate() async {
    if (_page!.next != null) {
      var page = await _allEpisodes!.toUpdate(_page!.next!);
      page.fold(
        (l) => null, //throw ErrorApi(l.message),
        (r) {
          if (_page!.next != r.next) {
            _page = r;
            List<Episode> list = r.episodes;
            for (var element in list) {
              episodes.contains(element) ? null : episodes.add(element);
            }
          }
        },
      );
    }
  }
}
