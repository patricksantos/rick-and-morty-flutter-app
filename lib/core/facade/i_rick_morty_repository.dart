import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/entity/page.dart';

abstract class IRickMortyRepository {
  Future<Page> firstPage();
  Future<Page> getPage(String url);
  Future<List<Episode>> allEpisodes();
  Future<Episode> getEpisode(int id);
}
