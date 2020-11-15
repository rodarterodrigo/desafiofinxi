import 'package:bloc/bloc.dart';
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
    LoadingState();
    if (event is LoadingSucessGifEvent) {
      yield* _mapGifsToState(event);
    }
  }

  Stream<GifState> _mapGifsToState(LoadingSucessGifEvent event) async* {
    if (state is LoadedSucessState) {
      this.search = event.searchText;
      final result = (await this.usecase.searchGif(event.searchText));
      yield result.fold((l) => ErrorState(l), (r) => LoadedSucessState(r));
    }
  }
}