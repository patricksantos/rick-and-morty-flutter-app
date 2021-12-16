import 'package:flutter_test/flutter_test.dart';
import 'package:rickmortyapp/core/repository/i_rick_morty_repository.dart';
import 'package:rickmortyapp/core/usecase/get_episode.dart';
import 'package:rickmortyapp/repository/rick_morty_repository.dart';

void main() {
  IRickMortyRepository repository = RickMortyRepository();
  GetEpisode getEpisode = GetEpisode(repository);

  test('', () async {});
}
