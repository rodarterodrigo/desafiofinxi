import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/search_gif_by_text_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/events/gif_event.dart';
import 'package:desafiofinxi/modules/search/presenter/routes/app_pages.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/settings/settings.dart';
import 'package:desafiofinxi/modules/search/presenter/states/gif_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class StartPage extends StatefulWidget {
  String searchGif;
  StartPage({this.searchGif});
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final gifBloc = Modular.get<GifBloc>();

  @override
  void initState() {
    gifBloc
        .add(SearchGifEvent(widget.searchGif, ItensPerPage, gifBloc.itemIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: gifBloc.gifList.length > 0
            ? StreamBuilder(
                initialData: LoadedSucessState,
                stream: gifBloc,
                builder: (context, snapshot) {
                  final state = gifBloc.state;
                  if (state is ErrorState)
                    return Center(
                      child: Text(state.failureSearch.message),
                    );
                  else {
                    final list = (state as LoadedSucessState).gifList;
                    return NotificationListener<ScrollNotification>(
                      child: list.length < 1
                          ? Center(child: CircularProgressIndicator())
                          : GridView.count(
                              crossAxisCount: 2,
                              children: List.generate(list.length, (index) {
                                return GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Hero(
                                      tag: list[index].downsizedImage,
                                      child: CachedNetworkImage(
                                        imageUrl: list[index].downsizedImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  onTap: () => Modular.to.pushNamed(
                                      Routes.GIFDETAILPAGE,
                                      arguments: list[index]),
                                );
                              })),
                      onNotification: (value) =>
                          gifBloc.handleNotification(value, widget.searchGif),
                    );
                  }
                },
              )
            : Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.amber, width: 4),
                        ),
                        child: Image.asset("lib/assets/images/palpatine.gif"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Clique em busca para derrotar o senhor do mal!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
