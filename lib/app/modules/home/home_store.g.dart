// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$_allEpisodesAtom = Atom(name: 'HomeStoreBase._allEpisodes');

  @override
  AllEpisodes? get _allEpisodes {
    _$_allEpisodesAtom.reportRead();
    return super._allEpisodes;
  }

  @override
  set _allEpisodes(AllEpisodes? value) {
    _$_allEpisodesAtom.reportWrite(value, super._allEpisodes, () {
      super._allEpisodes = value;
    });
  }

  final _$_pageAtom = Atom(name: 'HomeStoreBase._page');

  @override
  Page? get _page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  set _page(Page? value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  final _$episodesAtom = Atom(name: 'HomeStoreBase.episodes');

  @override
  List<Episode> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(List<Episode> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  final _$firstPageAsyncAction = AsyncAction('HomeStoreBase.firstPage');

  @override
  Future<void> firstPage() {
    return _$firstPageAsyncAction.run(() => super.firstPage());
  }

  final _$toUpdateAsyncAction = AsyncAction('HomeStoreBase.toUpdate');

  @override
  Future<void> toUpdate() {
    return _$toUpdateAsyncAction.run(() => super.toUpdate());
  }

  @override
  String toString() {
    return '''
episodes: ${episodes}
    ''';
  }
}
