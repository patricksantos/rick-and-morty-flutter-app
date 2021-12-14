import 'package:rickmortyapp/core/entity/character.dart';
import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/entity/page.dart';

class PageAdapter {
  static Page create(Map<String, dynamic> json) {
    List<Episode> episodes = (json['results'] as List).map((item) {
      List<Character> characters =
          (item['characters'] as List).map((character) {
        return Character(
          character['id'],
          character['name'],
          character['status'],
          character['species'],
          character['gender'],
          character['origin']["name"],
          character['location']["name"],
          character['image'],
        );
      }).toList();
      return Episode(
        item['id'],
        item['name'],
        item['episode'],
        item['air_date'],
        characters,
      );
    }).toList();

    Page page = Page(
      json['info']['count'],
      json['info']['pages'],
      json['info']['next'],
      json['info']['prev'],
      episodes,
    );
    return page;
  }
}
