import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickmortyapp/app/modules/episode/episode_store.dart';
import 'package:flutter/material.dart';

class EpisodePage extends StatefulWidget {
  final String title;
  const EpisodePage({Key? key, this.title = 'EpisodePage'}) : super(key: key);
  @override
  EpisodePageState createState() => EpisodePageState();
}
class EpisodePageState extends State<EpisodePage> {
  final EpisodeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}