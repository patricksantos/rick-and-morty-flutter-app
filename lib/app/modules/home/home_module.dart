import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickmortyapp/core/repository/i_rick_morty_repository.dart';
import 'package:rickmortyapp/repository/rick_morty_repository.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i())),
    Bind.instance<IRickMortyRepository>(RickMortyRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(),
    ),
  ];
}
