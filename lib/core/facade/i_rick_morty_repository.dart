import 'package:dartz/dartz.dart';
import 'package:rickmortyapp/core/entity/episode.dart';
import 'package:rickmortyapp/core/entity/page.dart';
import 'package:rickmortyapp/core/errors/erros.dart';

abstract class IRickMortyRepository {
  Future<Either<ErrorApi, Page>> firstPage();
  Future<Either<ErrorApi, Page>> getPage(String url);
  Future<Either<ErrorApi, List<Episode>>> allEpisodes();
  Future<Either<ErrorApi, Episode>> getEpisode(int id);
}
