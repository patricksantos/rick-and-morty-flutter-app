import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/entity/page.dart';

class PageAdapter {
  static Page create(Map<String, dynamic> json) {
    List<Episode> episodes = (json['results'] as List).map((episode) {
      List<String> characters = (episode['characters'] as List).map((item) {
        return item.toString();
      }).toList();

      return Episode(
        int.parse(episode['id'].toString()),
        episode['name'],
        episode['episode'],
        episode['air_date'],
        characters,
      );
    }).toList();

    Page page = Page(
      int.parse(json['info']['count'].toString()),
      int.parse(json['info']['pages'].toString()),
      json['info']['next'],
      json['info']['prev'],
      episodes,
    );
    return page;
  }
}
