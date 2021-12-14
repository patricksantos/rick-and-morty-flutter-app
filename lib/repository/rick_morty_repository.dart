import 'package:dio/dio.dart';
import 'package:rickmortyapp/adapter/page_adapter.dart';
import 'package:rickmortyapp/core/entity/page.dart';
import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/facade/i_rick_morty_repository.dart';

class RickMortyRepository implements IRickMortyRepository {
  final Dio _dio = Dio();

  @override
  Future<List<Episode>> allEpisodes() {
    // TODO: implement allEpisodes
    throw UnimplementedError();
  }

  @override
  Future<Episode> getEpisode(int id) async {
    Response response;
    response = await _dio.get("https://rickandmortyapi.com/api/episode/$id");
    Episode episode = response.data;
    return episode;
  }

  @override
  Future<Page> getPage(String url) async {
    Response response;
    response = await _dio.get(url);
    Page page = PageAdapter.create(response.data);
    return page;
  }

  @override
  Future<Page> firstPage() async {
    Response response;
    response = await _dio.get("https://rickandmortyapi.com/api/episode");
    Page page = PageAdapter.create(response.data);
    return page;
  }
}
