import 'package:bloc/bloc.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/get_search_gif_library.dart';
import 'package:desafiofinxi/modules/search/presenter/events/internal_data_events.dart';
import 'package:desafiofinxi/modules/search/presenter/states/internal_data_state.dart';

class LibraryBloc extends Bloc<InternalDataEvents, InternalDataState>{
  final GetSearchGifLibrary getSearchGifLibrary;

  int _oldId = 0;
  get oldId => _oldId;
  set oldId(int value) => _oldId = value;

  LibraryBloc(this.getSearchGifLibrary) : super(LoadingState());

  @override
  Stream<InternalDataState> mapEventToState(InternalDataEvents event) async*{
    if(event is GetAllGifEvent)
      yield* _mapGetAllGifsToState(event);
  }

  Stream<InternalDataState> _mapGetAllGifsToState(GetAllGifEvent event) async* {
    yield LoadingState();
    final result = (await this.getSearchGifLibrary.getAllGifLibrary());
    yield result.fold((l) => ErrorState(l), (r) => LoadedSucessState(r));
  }
}