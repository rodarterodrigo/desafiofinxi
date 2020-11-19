import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/update_gif_repository.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/update_search_gif.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class UpdateGifRepositoryMock extends Mock implements IUpdateGifRepository{}

final repository = UpdateGifRepositoryMock();
final usecase = UpdateSearchGif(repository);

main(){
  Gif gif = new Gif(giphyId: "teste", author: "teste", downsizedImage: "teste", id: 1, name: "teste", originalImage: "teste", url: "teste");
  Gif emptyGif = new Gif(giphyId: "", author: "", downsizedImage: "", id: 1, name: "", originalImage: "", url: "");
  Gif nullGif = null;
  test("Deve retornar o indice do gif atualizado", () async {
    when(repository.updateGif(any)).thenAnswer((realInvocation) async => Right(realInvocation.hashCode));
    final result = await usecase.updateGif(gif);
    expect(result | null, isA<int>());
  });

  test("Deve retornar o indice do gif atualizado", () async {
    when(repository.updateGif(any)).thenAnswer((realInvocation) async => Right(realInvocation.hashCode));
    final result = await usecase.updateGif(emptyGif);
    expect(result | null, isA<int>());
  });

  test("Deve retornar uma exceção", () async {
    when(repository.updateGif(any)).thenAnswer((realInvocation) async => Right(realInvocation.hashCode));
    final result = await usecase.updateGif(nullGif);
    expect(result.fold(id,id), isA<InvalidEntityError>());
  });

  test("Deve retornar uma exceção", () async {
    when(repository.updateGif(any)).thenThrow(Exception());
    final result = await usecase.updateGif(nullGif);
    expect(result.fold(id,id), isA<InvalidEntityError>());
  });
}