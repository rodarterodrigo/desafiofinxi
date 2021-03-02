import 'package:bloc/bloc.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/get_search_gif_library.dart';
import 'package:desafiofinxi/modules/search/presenter/events/internal_data_events.dart';
import 'package:desafiofinxi/modules/search/presenter/states/internal_data_state.dart';
import 'package:rxdart/rxdart.dart';

class LibraryBloc extends Bloc<InternalDataEvents, InternalDataState> {
  final GetSearchGifLibrary getSearchGifLibrary;

  int _oldId = 0;
  // ignore: unnecessary_getters_setters
  get oldId => _oldId;
  // ignore: unnecessary_getters_setters
  set oldId(int value) => _oldId = value;

  LibraryBloc(this.getSearchGifLibrary) : super(LoadingState());

  @override
  Stream<InternalDataState> mapEventToState(InternalDataEvents event) async* {
    if (event is GetAllGifEvent) yield* _mapGetAllGifsToState(event);
  }

  @override
  Stream<Transition<InternalDataEvents, InternalDataState>> transformEvents(
      Stream<InternalDataEvents> events, transitionFn) {
    events = events.debounceTime(Duration(milliseconds: 400));
    return super.transformEvents(events, transitionFn);
  }

  Stream<InternalDataState> _mapGetAllGifsToState(GetAllGifEvent event) async* {
    yield LoadingState();
    final result = (await this.getSearchGifLibrary.getAllGifLibrary());
    yield result.fold((l) => ErrorState(l), (r) => LoadedSucessState(r));
  }
}
