import 'package:desafiofinxi/modules/search/presenter/blocs/home_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/events/navigation_event.dart';
import 'package:desafiofinxi/modules/search/presenter/states/navigation_state.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  final bloc = HomeBloc();

  test("Must return the states in order", (){
    expect(bloc, emitsInOrder([
      isA<IndexSuccess>(),
    ]));
    bloc.add(MapIndexEvent(2));
  });

  test("Must return an error", (){
    expect(bloc, emitsInOrder([
      isA<IndError>(),
    ]));
    bloc.add(MapIndexEvent(null));
  });
}