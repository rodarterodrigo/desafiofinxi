import 'package:bloc/bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/errors/errors.dart';
import 'package:desafiofinxi/modules/search/presenter/events/navigation_event.dart';
import 'package:desafiofinxi/modules/search/presenter/states/navigation_state.dart';

class HomeBloc extends Bloc<NavigationEvent, INavigationState>{

  int _index = 0;
  get index => _index;
  set index(value) => _index = value;

  String _search = "";
  get search => _search;
  set search(value) => _search = value;

  HomeBloc() : super(IndexSuccess());

  @override
  Stream<INavigationState> mapEventToState(NavigationEvent event) async*{
    if(event is MapIndexEvent) {
      yield* _mapIndexToState(event);
    }
    if(event is MapSearchEvent) {
      yield* _mapSearchToState(event);
    }
  }

  Stream<INavigationState> _mapIndexToState(MapIndexEvent event) async* {
    if (event.index == null) yield IndError(IndexError(message: "Erro na resolução do indice"));
    this.index = event.index;
    yield IndexSuccess(index: this.index);
  }

  Stream<INavigationState> _mapSearchToState(MapSearchEvent event) async* {
    if (event.search == null) yield IndError(IndexError(message: "Erro na resolução da string"));
    this.search = event.search;
    yield IndexSuccess(index: this.index);
  }
}