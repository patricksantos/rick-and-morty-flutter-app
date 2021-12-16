import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rickmortyapp/adapter/character_adapter.dart';
import 'package:rickmortyapp/adapter/episode_adapter.dart';
import 'package:rickmortyapp/adapter/page_adapter.dart';
import 'package:rickmortyapp/core/entity/character.dart';
import 'package:rickmortyapp/core/entity/page.dart';
import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/errors/erros.dart';
import 'package:rickmortyapp/core/repository/i_rick_morty_repository.dart';

class RickMortyRepository implements IRickMortyRepository {
  final Dio _dio = Dio();

  @override
  Future<Either<ErrorApi, List<Episode>>> allEpisodes() async {
    try {
      List<Episode> listEpisode = <Episode>[];

      Response response =
          await _dio.get("https://rickandmortyapi.com/api/episode");
      Page page = PageAdapter.create(response.data);
      listEpisode.addAll(page.episodes);

      String? nextPage = page.next;
      for (int i = 2; i <= 3; i++) {
        if (nextPage != null) {
          var data = await getPage(nextPage!);
          data.fold((l) => left(ErrorApi(l.message)), (r) {
            nextPage = r.next;
            listEpisode.addAll(r.episodes);
          });
        }
      }

      return right(listEpisode);
    } catch (e) {
      return left(ErrorApi(e.toString()));
    }
  }

  @override
  Future<Either<ErrorApi, Episode>> getEpisode(int id) async {
    try {
      Response response =
          await _dio.get("https://rickandmortyapi.com/api/episode/$id");
      Episode episode = EpisodeAdapter.create(response.data);
      return right(episode);
    } catch (e) {
      return left(ErrorApi(e.toString()));
    }
  }

  @override
  Future<Either<ErrorApi, Page>> getPage(String url) async {
    try {
      Response response = await _dio.get(url);
      Page page = PageAdapter.create(response.data);
      return right(page);
    } catch (e) {
      return left(ErrorApi(e.toString()));
    }
  }

  @override
  Future<Either<ErrorApi, Page>> firstPage() async {
    try {
      Response response =
          await _dio.get("https://rickandmortyapi.com/api/episode");
      Page page = PageAdapter.create(response.data);
      return right(page);
    } catch (e) {
      return left(ErrorApi(e.toString()));
    }
  }

  @override
  Future<Either<ErrorApi, Character>> getCharacter(String url) async {
    try {
      Response response = await _dio.get(url);
      Character character = CharacterAdapter.create(response.data);
      return right(character);
    } catch (e) {
      return left(ErrorApi(e.toString()));
    }
  }
}
