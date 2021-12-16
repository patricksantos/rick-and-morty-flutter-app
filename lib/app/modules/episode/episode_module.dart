import 'package:rickmortyapp/app/modules/episode/episode_page.dart';
import 'package:rickmortyapp/app/modules/episode/episode_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EpisodeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EpisodeStore()),
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
