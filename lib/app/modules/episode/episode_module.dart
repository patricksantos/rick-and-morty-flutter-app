import 'package:rickmortyapp/app/modules/episode/episode_page.dart';
import 'package:rickmortyapp/app/modules/episode/episode_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickmortyapp/repository/rick_morty_repository.dart';

class EpisodeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EpisodeStore(i())),
    Bind.lazySingleton((i) => RickMortyRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/:id',
      child: (context, args) => EpisodePage(
        id: args.params['id'],
      ),
    ),
  ];
}
