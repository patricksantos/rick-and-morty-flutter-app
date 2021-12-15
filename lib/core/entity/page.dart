import 'package:rickmortyapp/core/entity/episode.dart';

class Page {
  final int _count;
  final int _pages;
  final String? _next;
  final String? _prev;
  final List<Episode> _episodes;

  Page(
    this._count,
    this._pages,
    this._next,
    this._prev,
    this._episodes,
  );

  int get count => _count;
  int get pages => _pages;
  String? get next => _next;
  String? get prev => _prev;
  List<Episode> get episodes => _episodes;
}
