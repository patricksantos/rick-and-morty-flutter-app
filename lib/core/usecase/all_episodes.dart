import 'package:dartz/dartz.dart';
import 'package:rickmortyapp/core/entity/page.dart';
import 'package:rickmortyapp/core/errors/erros.dart';
import 'package:rickmortyapp/core/facade/i_rick_morty_repository.dart';

class AllEpisodes {
  final IRickMortyRepository _repository;
  Page? _page;

  AllEpisodes(this._repository);

  Future<Either<ErrorApi, Page>> execute() async {
    var firstPage = await _repository.firstPage();
    return firstPage.fold(
      (l) => left(ErrorApi(l.message)),
      (r) => right(r),
    );
  }

  Future<Either<ErrorApi, Page?>> toUpdate(String url) async {
    if (_page == null) {
      if (_page!.next == null) return right(null);
      var getPage = await _repository.getPage(_page!.next!);
      return getPage.fold(
        (l) => left(ErrorApi(l.message)),
        (r) => right(r),
      );
    } else {
      var execute = await this.execute();
      return execute.fold(
        (l) => left(ErrorApi(l.message)),
        (r) => right(r),
      );
    }
  }
}
