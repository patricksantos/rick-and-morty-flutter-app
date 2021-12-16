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

  final _$charactersAtom = Atom(name: '_EpisodeStoreBase.characters');

  @override
  List<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(List<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$getEpisodeAsyncAction = AsyncAction('_EpisodeStoreBase.getEpisode');

  @override
  Future<void> getEpisode(int id) {
    return _$getEpisodeAsyncAction.run(() => super.getEpisode(id));
  }

  final _$_getAllCharactersAsyncAction =
      AsyncAction('_EpisodeStoreBase._getAllCharacters');

  @override
  Future<void> _getAllCharacters(List<String> urls) {
    return _$_getAllCharactersAsyncAction
        .run(() => super._getAllCharacters(urls));
  }

  final _$_characterAsyncAction = AsyncAction('_EpisodeStoreBase._character');

  @override
  Future<void> _character(String url) {
    return _$_characterAsyncAction.run(() => super._character(url));
  }

  @override
  String toString() {
    return '''
episode: ${episode},
characters: ${characters}
    ''';
  }
}
