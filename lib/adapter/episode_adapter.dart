import 'package:rickmortyapp/core/entity/episode.dart';

class EpisodeAdapter {
  static Episode create(Map<String, dynamic> json) {
    Episode episode = Episode(
      int.parse(json['id'].toString()),
      json['name'],
      json['episode'],
      json['air_date'],
      [],
    );
    return episode;
  }
}
