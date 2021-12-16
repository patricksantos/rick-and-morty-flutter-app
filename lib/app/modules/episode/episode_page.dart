import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickmortyapp/app/modules/episode/episode_store.dart';
import 'package:flutter/material.dart';

class EpisodePage extends StatefulWidget {
  final String id;
  final String title;
  const EpisodePage({Key? key, this.title = 'Episode Detail', required this.id})
      : super(key: key);
  @override
  EpisodePageState createState() => EpisodePageState();
}

class EpisodePageState extends State<EpisodePage> {
  final EpisodeStore store = Modular.get();

  @override
  void initState() {
    store.getEpisode(int.parse(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(
          builder: (context) => store.episode == null
              ? Text(widget.title)
              : Text(
                  store.episode!.name.toString(),
                ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[Text(widget.id.toString())],
          ),
          Observer(
            builder: (context) => store.episode == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
