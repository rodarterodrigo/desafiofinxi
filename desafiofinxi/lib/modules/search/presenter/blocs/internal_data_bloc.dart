import 'package:bloc/bloc.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/delete_gif_by_id.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/save_search_gif.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/update_search_gif.dart';
import 'package:desafiofinxi/modules/search/presenter/events/internal_data_events.dart';
import 'package:desafiofinxi/modules/search/presenter/states/internal_data_state.dart';
import 'package:rxdart/rxdart.dart';

class InternalDataBloc extends Bloc<InternalDataEvents, InternalDataState>{
  final SaveSearchGif saveSearchGif;
  final UpdateSearchGif updateSearchGif;
  final DeleteGifById deleteGifById;

  Gif _gif = Gif();
  get gif => _gif;
  set gif(value) => _gif = value;

  int _saveId = 0;
  get saveId => _saveId;
  set saveId(int value) => _saveId = value;

  int _deletedId = 0;
  get deletedId => _deletedId;
  set deletedId(int value) => _deletedId = value;

  InternalDataBloc(this.saveSearchGif, this.updateSearchGif, this.deleteGifById) : super(InitialState());

  @override
  Stream<InternalDataState> mapEventToState(InternalDataEvents event) async*{
    if(event is SaveGifEvent)
      yield* _mapSaveGifsToState(event);
    if(event is UpdateGifEvent)
      yield* _mapUpdateGifToState(event);
    if(event is DeleteGifEvent)
      yield* _mapDeleteGifToState(event);
  }

  @override
  Stream<Transition<InternalDataEvents, InternalDataState>> transformEvents(
      Stream<InternalDataEvents> events, transitionFn) {
    events = events.debounceTime(Duration(milliseconds: 400));
    return super.transformEvents(events, transitionFn);
  }

  Stream<InternalDataState> _mapSaveGifsToState(SaveGifEvent event) async* {
    yield LoadingState();
    final result = (await this.saveSearchGif.postGif(event.gif));
    yield result.fold((l) => ErrorState(l), (r) => InsertSucessState(r));
  }

  Stream<InternalDataState> _mapUpdateGifToState(UpdateGifEvent event) async* {
    yield LoadingState();
    final result = (await this.updateSearchGif.updateGif(event.gif));
    yield result.fold((l) => ErrorState(l), (r) => UpdateSucessState(r));
  }

  Stream<InternalDataState> _mapDeleteGifToState(DeleteGifEvent event) async* {
    yield LoadingState();
    final result = (await this.deleteGifById.deleteGifByiD(event.id));
    yield result.fold((l) => ErrorState(l), (r) => DeleteSucessState(r));
  }
}