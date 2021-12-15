import 'package:flutter_test/flutter_test.dart';
import 'package:rickmortyapp/core/facade/i_rick_morty_repository.dart';
import 'package:rickmortyapp/repository/rick_morty_repository.dart';

void main() {
  IRickMortyRepository repository = RickMortyRepository();

  test('numero total de episodios', () async {
    var episodes = await repository.allEpisodes();
    episodes.fold(
      (l) {},
      (r) => expect(r.length, 51),
    );
  });

  test('retorno de um episodio', () async {
    var episode1 = await repository.getEpisode(1);
    episode1.fold(
      (l) {},
      (r) => expect(r.id, 1),
    );

    var episode2 = await repository.getEpisode(2);
    episode2.fold(
      (l) {},
      (r) => expect(r.id, 2),
    );
  });

  test('retorno da proxima pagina', () async {
    var page = await repository.firstPage();
    page.fold(
      (l) {},
      (r) => expect(r.next, "https://rickandmortyapi.com/api/episode?page=2"),
    );

    var pageTwo =
        await repository.getPage(page.toOption().toNullable()!.next.toString());
    pageTwo.fold(
      (l) {},
      (r) => expect(r.next, "https://rickandmortyapi.com/api/episode?page=3"),
    );
  });

  test('get page', () async {
    var pageTwo = await repository
        .getPage("https://rickandmortyapi.com/api/episode?page=3");
    pageTwo.fold(
      (l) {},
      (r) => expect(r.next, null),
    );
  });

  test('retorno da proxima pagina', () async {
    var page = await repository.firstPage();
    page.fold(
      (l) {},
      (r) => expect(r.prev, null),
    );
  });

  test('retorno de episodios', () async {
    var page = await repository.firstPage();
    page.fold(
      (l) {},
      (r) => expect(r.count, 51),
    );
  });

  test('numero total de paginas', () async {
    var page = await repository.firstPage();
    page.fold(
      (l) {},
      (r) => expect(r.pages, 3),
    );
  });

  test('primeiro episodio', () async {
    var page = await repository.firstPage();
    page.fold(
      (l) {},
      (r) => expect(r.episodes.first.id, 1),
    );
  });
}
