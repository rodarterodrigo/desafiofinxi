import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/search_gif_by_text.dart';
import 'package:desafiofinxi/modules/search/presenter/events/gif_event.dart';
import 'package:desafiofinxi/modules/search/presenter/states/gif_state.dart';

class GifBloc extends Bloc<GifEvent, GifState> {

  final SearchGifByText usecase;

  GifBloc(this.usecase):super(LoadingState());

  String _search = "";
  get search => _search;
  set search(value) => _search = value;

  @override
  Stream<GifState> mapEventToState(GifEvent event) async* {
    yield LoadingState();
    if (event is SearchGifEvent) {
      yield* _mapGifsToState(event);
    }
  }

  Stream<GifState> _mapGifsToState(SearchGifEvent event) async* {
    this.search = event.searchText;
    final result = (await this.usecase.searchGif(event.searchText));
    yield result.fold((l) => ErrorState(l), (r) => LoadedSucessState(r));
  }

  @override
  Stream<Transition<GifEvent, GifState>> transformEvents(
      Stream<GifEvent> events, transitionFn) {
    events = events.debounceTime(Duration(milliseconds: 500));
    return super.transformEvents(events, transitionFn);
  }
}