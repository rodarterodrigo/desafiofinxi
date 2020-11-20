import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/search_gif_by_text.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/search_gif_by_text_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/events/gif_event.dart';
import 'package:desafiofinxi/modules/search/presenter/states/gif_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchGifByTextMock extends Mock implements SearchGifByText{}

final usecase = SearchGifByTextMock();
final bloc = GifBloc(usecase);

main(){
  test("Deve retornar os estados em ordem.", (){
    when(usecase.searchGif(any, any, any)).thenAnswer((realInvocation) async => Right(List<Gif>()));
    expect(bloc, emitsInOrder([
      isA<LoadedSucessState>(),
    ]));
    bloc.add(SearchGifEvent("starwars", 20, 0));
  });

  test("Deve retornar os estados em ordem.", (){
    when(usecase.searchGif(any, any, any)).thenAnswer((realInvocation) async => Left(InvalidTextError()));
    expect(bloc, emitsInOrder([
      isA<ErrorState>(),
    ]));
    bloc.add(SearchGifEvent("starwars", 20, 0));
  });
}