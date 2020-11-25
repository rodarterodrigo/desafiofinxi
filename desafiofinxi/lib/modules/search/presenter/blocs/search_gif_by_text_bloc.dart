import 'package:bloc/bloc.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/search_gif_by_text.dart';
import 'package:desafiofinxi/modules/search/presenter/events/gif_event.dart';
import 'package:desafiofinxi/modules/search/presenter/states/gif_state.dart';

class GifBloc extends Bloc<GifEvent, GifState> {

  final SearchGifByText usecase;

  GifBloc(this.usecase):super(InitialState());

  List<Gif> _gifList = List<Gif>();
  get gifList => _gifList;
  set gifList(value) => _gifList = value;

  String _searchText = "";
  get searchText => _searchText;
  set searchText(value) => _searchText = value;

  int _itemIndex = 0;
  get itemIndex => _itemIndex;
  set itemIndex(value) => _itemIndex = value;

  bool _lastGifPage = false;
  get lastGifPage => this._lastGifPage;
  set lastGifPage(value) => this._lastGifPage = value;

  int _gifPage = 1;
  get gifPage => this._gifPage;
  set gifPage(value) => this._gifPage = value;

  int _finalGifPage = 1;
  get finalGifPage => this._finalGifPage;
  set finalGifPage(value) => this._finalGifPage = value;

  void initialize(){
    finalGifPage = 1;
    gifPage = 1;
    itemIndex = 0;
    gifList = List<Gif>();
    lastGifPage = false;
  }

  bool handleNotification(ScrollNotification scrollInfo, String searchGif){
    if(scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent){
      if(!lastGifPage){
        gifPage++;
        lastGifPage = true;
        this.add(SearchGifEvent(searchGif, ItensPerPage, returnItemIndex(gifPage)));
      }
    }
  }

  int returnItemIndex(int page) => this.itemIndex = ((page - 1) * ItensPerPage);

  @override
  Stream<GifState> mapEventToState(GifEvent event) async* {
    if (event is SearchGifEvent) {
      yield* _mapGifsToState(event);
    }
  }

  Stream<GifState> _mapGifsToState(SearchGifEvent event) async* {
   // yield LoadingState();
    final result = (await this.usecase.searchGif(event.searchText, event.itensPerPage, event.indexItem));
    yield result.fold((l) => ErrorState(l), (r) {
      if(LoadedSucessState(r).gifList.length < ItensPerPage) lastGifPage = true; else lastGifPage = false;
      if(gifPage == 1)
        this.gifList = r;
      else
        if(gifPage != finalGifPage){
          this.gifList += r;
          finalGifPage = gifPage;
        }
      return LoadedSucessState(gifList);
    });
  }

  @override
  Stream<Transition<GifEvent, GifState>> transformEvents(
      Stream<GifEvent> events, transitionFn) {
    events = events.debounceTime(Duration(milliseconds: 400));
    return super.transformEvents(events, transitionFn);
  }
}