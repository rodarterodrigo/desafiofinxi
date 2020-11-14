import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/infra/datasources/gif_search_datasource.dart';
import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';
import 'package:desafiofinxi/modules/search/infra/repositories/gif_search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements IGifSearchDatasource{}

final datasource = SearchDatasourceMock();
final repository = GifSearchRepository(datasource);

main(){
  test("Must return a Gif list", () async{
    when(datasource.gifSearch(any)).thenAnswer((realInvocation) async => List<GifModel>());
    final result = await repository.searchGif("RodarthVader");
    expect(result | null, isA<List<Gif>>());
  });
}