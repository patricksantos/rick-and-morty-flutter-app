// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EpisodeStore on _EpisodeStoreBase, Store {
  final _$episodeAtom = Atom(name: '_EpisodeStoreBase.episode');

  @override
  Episode? get episode {
    _$episodeAtom.reportRead();
    return super.episode;
  }

  @override
  set episode(Episode? value) {
    _$episodeAtom.reportWrite(value, super.episode, () {
      super.episode = value;
    });
  }

  final _$getEpisodeAsyncAction = AsyncAction('_EpisodeStoreBase.getEpisode');

  @override
  Future getEpisode(int id) {
    return _$getEpisodeAsyncAction.run(() => super.getEpisode(id));
  }

  @override
  String toString() {
    return '''
episode: ${episode}
    ''';
  }
}
