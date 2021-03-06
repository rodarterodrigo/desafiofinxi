import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/save_gif_repository.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/save_search_gif.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SaveGifRepositoryMock extends Mock implements ISaveGifRepository {}

final repository = SaveGifRepositoryMock();
final usecase = SaveSearchGif(repository);

main() {
  Gif gif = new Gif(
      giphyId: "teste",
      author: "teste",
      downsizedImage: "teste",
      id: 1,
      name: "teste",
      originalImage: "teste",
      url: "teste");
  Gif emptyGif = new Gif(
      giphyId: "",
      author: "",
      downsizedImage: "",
      id: 1,
      name: "",
      originalImage: "",
      url: "");
  // ignore: avoid_init_to_null
  Gif nullGif = null;
  test("Deve retornar o indice do gif salvo", () async {
    when(repository.postGif(any))
        .thenAnswer((realInvocation) async => Right(realInvocation.hashCode));
    final result = await usecase.postGif(gif);
    expect(result | null, isA<int>());
  });

  test("Deve retornar o indice do gif salvo", () async {
    when(repository.postGif(any))
        .thenAnswer((realInvocation) async => Right(realInvocation.hashCode));
    final result = await usecase.postGif(emptyGif);
    expect(result | null, isA<int>());
  });

  test("Deve retornar uma exceção", () async {
    when(repository.postGif(any))
        .thenAnswer((realInvocation) async => Right(realInvocation.hashCode));
    final result = await usecase.postGif(nullGif);
    expect(result.fold(id, id), isA<InvalidEntityError>());
  });

  test("Deve retornar uma exceção", () async {
    when(repository.postGif(any)).thenThrow(Exception());
    final result = await usecase.postGif(nullGif);
    expect(result.fold(id, id), isA<InvalidEntityError>());
  });
}
