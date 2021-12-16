import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickmortyapp/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    store.firstPage();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController!.position.extentAfter < 500) {
      store.toUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Rick and Morty Episodes'),
      ),
      body: Observer(
        builder: (context) => store.isEmptyEpisode
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scrollbar(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: store.episodes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Modular.to
                          .pushNamed('/episode/${store.episodes[index].id}'),
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        child: ListTile(
                          title: Text(store.episodes[index].name),
                          subtitle: Text(store.episodes[index].episode),
                          leading: const SizedBox(
                            width: 50,
                            child: Center(
                              child: Icon(
                                Icons.movie,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
