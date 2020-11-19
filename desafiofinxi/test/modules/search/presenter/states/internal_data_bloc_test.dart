import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/delete_gif_by_id.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/save_search_gif.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/update_search_gif.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/internal_data_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/events/internal_data_events.dart';
import 'package:desafiofinxi/modules/search/presenter/states/internal_data_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SaveSearchGifByTextMock extends Mock implements SaveSearchGif{}
class UpdateSearchGifByTextMock extends Mock implements UpdateSearchGif{}
class DeleteSearchGifByIdMock extends Mock implements DeleteGifById{}

final saveGif = SaveSearchGifByTextMock();
final updateGif = UpdateSearchGifByTextMock();
final deleteGif = DeleteSearchGifByIdMock();

final bloc = InternalDataBloc(saveGif, updateGif, deleteGif);

final Gif gif = new Gif(giphyId: "teste", author: "teste", downsizedImage: "teste", id: 1, name: "teste", originalImage: "teste", url: "teste");
final Gif emptyGif = new Gif(giphyId: "", author: "", downsizedImage: "", id: 1, name: "", originalImage: "", url: "");
final Gif nullGif = null;

main(){
  test("Deve retornar os estados em ordem", (){
    when(saveGif.postGif(any)).thenAnswer((realInvocation) async => Right(realInvocation.hashCode));
    expect(bloc, emitsInOrder([
      isA<LoadingState>(),
      isA<InsertSucessState>(),
    ]));
    bloc.add(SaveGifEvent(gif));
  });

  test("Deve retornar os estados em ordem", (){
    when(saveGif.postGif(any)).thenAnswer((realInvocation) async => Right(realInvocation.hashCode));
    expect(bloc, emitsInOrder([
      isA<LoadingState>(),
      isA<InsertSucessState>(),
    ]));
    bloc.add(SaveGifEvent(emptyGif));
  });

  test("Deve retornar os estados em ordem e retornar um ErrorState", (){
    when(saveGif.postGif(any)).thenAnswer((realInvocation) async => Left(InvalidEntityError()));
    expect(bloc, emitsInOrder([
      isA<LoadingState>(),
      isA<ErrorState>(),
    ]));
    bloc.add(SaveGifEvent(gif));
  });
}