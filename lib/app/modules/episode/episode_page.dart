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
      body: Observer(
        builder: (context) => store.episode == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 25),
                    const Center(
                      child: Icon(
                        Icons.movie,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      store.episode!.episode.toString(),
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      store.episode!.date.toString(),
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                      ),
                    ),
                    Observer(
                      builder: (context) => store.characters.isNotEmpty
                          ? SingleChildScrollView(
                              physics: const ScrollPhysics(),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                      bottom: 5,
                                    ),
                                    child: const Text(
                                      'Characters',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: store.characters.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 6,
                                        ),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 32.0,
                                            backgroundColor: Colors.transparent,
                                            child: ClipOval(
                                              child: Image.network(
                                                store.characters[index].image,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            store.characters[index].name,
                                          ),
                                          subtitle: Text(
                                            store.characters[index].origin,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: const Text(
                                    'Characters',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                const Center(
                                  child: CircularProgressIndicator(),
                                )
                              ],
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
