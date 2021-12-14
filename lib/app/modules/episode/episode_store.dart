import 'package:mobx/mobx.dart';

part 'episode_store.g.dart';

class EpisodeStore = _EpisodeStoreBase with _$EpisodeStore;
abstract class _EpisodeStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}