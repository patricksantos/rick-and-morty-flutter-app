import 'package:rickmortyapp/core/entity/episode.dart';

class EpisodeAdapter {
  static Episode create(Map<String, dynamic> json) {
    List<String> characters = (json['characters'] as List).map((item) {
      return item.toString();
    }).toList();

    Episode episode = Episode(
      int.parse(json['id'].toString()),
      json['name'],
      json['episode'],
      json['air_date'],
      characters,
    );
    return episode;
  }
}
