// import 'package:flutter_test/flutter_test.dart';
// import 'package:rickmortyapp/core/entity/episode.dart';
// import 'package:rickmortyapp/core/entity/page.dart';
// import 'package:rickmortyapp/core/facade/i_rick_morty_repository.dart';
// import 'package:rickmortyapp/repository/rick_morty_repository.dart';

// void main() {
//   IRickMortyRepository repository = RickMortyRepository();

//   test('numero total de episodios', () async {
//     var episodes = await repository.allEpisodes();
//     episodes.forEach((episode) {
//       print(episode.id);
//     });
//     expect(episodes.length, 51);
//   });

//   test('retorno de um episodio', () async {
//     Episode episode1 = await repository.getEpisode(1);
//     expect(episode1.id, 1);
//     Episode episode2 = await repository.getEpisode(2);
//     expect(episode2.id, 2);
//   });

//   test('retorno da proxima pagina', () async {
//     Page page = await repository.firstPage();
//     expect(page.next, "https://rickandmortyapi.com/api/episode?page=2");

//     Page pageTwo = await repository.getPage(page.next!);
//     expect(pageTwo.next, "https://rickandmortyapi.com/api/episode?page=3");
//   });

//   test('get page', () async {
//     Page pageTwo = await repository
//         .getPage("https://rickandmortyapi.com/api/episode?page=3");
//     expect(pageTwo.next, null);
//   });

//   test('retorno da proxima pagina', () async {
//     Page page = await repository.firstPage();
//     expect(page.prev, null);
//   });

//   test('retorno de episodios', () async {
//     Page page = await repository.firstPage();
//     expect(page.count, 51);
//   });

//   test('numero total de paginas', () async {
//     Page page = await repository.firstPage();
//     expect(page.pages, 3);
//   });

//   test('primeiro episodio', () async {
//     Page page = await repository.firstPage();
//     expect(page.episodes.first.id, 1);
//   });
// }
