import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/search_gif_by_text_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/routes/app_pages.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/settings/settings.dart';
import 'package:desafiofinxi/modules/search/presenter/states/gif_state.dart';
import 'package:desafiofinxi/modules/search/presenter/events/gif_event.dart';
import 'package:desafiofinxi/modules/search/presenter/search_delegate/search_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  final GifBloc gifBloc = Modular.get<GifBloc>();
  final SearchHelper searchHelper = new SearchHelper();

  @override
  String get searchFieldLabel => "Busque um gif!";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: (){
        close(context, query == null? "": query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isNotEmpty){
      gifBloc.searchText = query;
      gifBloc.add(SearchGifEvent(query, ItensPerPage, gifBloc.itemIndex));
      return StreamBuilder(
        stream: gifBloc,
        builder: (context, snapshot){
          final state = gifBloc.state;
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return searchHelper.verifyConnection();
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.done:
              if(state is ErrorState) return searchHelper.dataFail();
              final list = (state as LoadedSucessState).gifList;
              return NotificationListener<ScrollNotification>(
                child: list.length <1 ? Center(child: CircularProgressIndicator()): GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(list.length, (index) {
                      return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Hero(
                            tag: list[index].downsizedImage,
                            child: CachedNetworkImage(
                              imageUrl: list[index].downsizedImage, fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        onTap: () => Modular.to.pushNamed(Routes.GIFDETAILPAGE,arguments: list[index]),
                      );
                    }
                    )
                ),
                onNotification: (value) => gifBloc.handleNotification(value, query),
              );
              // }else
              return searchHelper.dataFail();
          }
          return searchHelper.noResult();
        },
      );
    }else {
      return searchHelper.noResult();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isNotEmpty){
      gifBloc.initialize();
      gifBloc.searchText = query;
      gifBloc.add(SearchGifEvent(query, ItensPerPage, gifBloc.itemIndex));
      return StreamBuilder(
        stream: gifBloc,
        builder: (context, snapshot){
          final state = gifBloc.state;
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return searchHelper.verifyConnection();
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
                if(state is ErrorState) return searchHelper.dataFail();
                final list = (state as LoadedSucessState).gifList;
                return NotificationListener<ScrollNotification>(
                  child: list.length <1 ? Center(child: CircularProgressIndicator()): GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(list.length, (index) {
                          return GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Hero(
                                tag: list[index].downsizedImage,
                                child: CachedNetworkImage(
                                  imageUrl: list[index].downsizedImage, fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () => Modular.to.pushNamed(Routes.GIFDETAILPAGE,arguments: list[index]),
                          );
                        }
                      )
                  ),
                  onNotification: (value) => gifBloc.handleNotification(value, query),
                );
              // }else
                return searchHelper.dataFail();
          }
          return searchHelper.noResult();
        },
      );
    }else {
      return searchHelper.noResult();
    }
  }
}