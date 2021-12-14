import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/entity/page.dart';
import 'package:rickmortyapp/core/facade/i_rick_morty_repository.dart';

class AllEpisodes {
  final IRickMortyRepository _repository;
  Page? _page;

  AllEpisodes(this._repository);

  Future<Page> execute() async {
    var firstPage = await _repository.firstPage();
    if (_page == null) _page = firstPage;
    return firstPage;
  }

  Future<Page> toUpdate(String url) async {
    if (_page == null) {
      return await _repository.getPage(_page!.next);
    } else {
      return execute();
    }
  }
}
