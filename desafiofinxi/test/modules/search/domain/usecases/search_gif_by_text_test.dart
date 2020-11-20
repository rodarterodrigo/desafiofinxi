import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/gif_search_repository.dart';
import 'package:desafiofinxi/modules/search/domain/usecases/search_gif_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements IGifSearchRepository{}

final repository = SearchRepositoryMock();
final usecase = SearchGifByText(repository);

main(){

  test("Deve retornar uma lista de gif's matadores", () async {
    when(repository.searchGif(any, any, any)).thenAnswer((realInvocation) async => Right(List<Gif>()));
    final result = await usecase.searchGif("jarjar", 20, 0);
    expect(result | null, isA<List<Gif>>());
  });

  test("Deve retornar uma lista de gif's matadores", () async {
    when(repository.searchGif(any, any, any)).thenAnswer((realInvocation) async => Right(List<Gif>()));
    final result = await usecase.searchGif("", 20, 0);
    expect(result | null, isA<List<Gif>>());
  });

  test("Deve retornar uma exceção do tipo InvalidTextError", () async{
    when(repository.searchGif(any, any, any)).thenAnswer((realInvocation) async => Right(List<Gif>()));
    final result = await usecase.searchGif(null, 20, 0);
    expect(result.fold(id,id), isA<InvalidTextError>());
  });
}