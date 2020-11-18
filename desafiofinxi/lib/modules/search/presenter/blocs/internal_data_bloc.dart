import 'package:bloc/bloc.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/save_search_gif.dart';
import 'package:desafiofinxi/modules/search/presenter/events/internal_data_events.dart';
import 'package:desafiofinxi/modules/search/presenter/states/internal_data_state.dart';

class InternalDataBloc extends Bloc<InternalDataEvents, InternalDataState>{
  final SaveSearchGif usecase;

  InternalDataBloc(this.usecase) : super(InitialState());

  @override
  Stream<InternalDataState> mapEventToState(InternalDataEvents event) async*{
    if(event is SaveGifEvent)
      yield* _mapSaveGifsToState(event);
  }

  Stream<InternalDataState> _mapSaveGifsToState(SaveGifEvent event) async* {
    yield LoadingState();
    final result = (await this.usecase.postGif(event.gif));
    yield result.fold((l) => ErrorState(l), (r) => InsertSucessState(r));
  }
}