import 'package:flutter_test/flutter_test.dart';
import 'package:rickmortyapp/core/facade/i_rick_morty_repository.dart';
import 'package:rickmortyapp/core/usecase/all_episodes.dart';
import 'package:rickmortyapp/repository/rick_morty_repository.dart';

void main() {
  IRickMortyRepository repository = RickMortyRepository();
  AllEpisodes allEpisodes = AllEpisodes(repository);

  test('', () async {});
}
