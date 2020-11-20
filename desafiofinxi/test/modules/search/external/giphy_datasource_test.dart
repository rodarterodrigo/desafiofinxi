import 'dart:convert';

import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/external/datasources/giphy_datasource.dart';
import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/gif_search_datasource_response.dart';

class DioMock extends Mock implements Dio{}

final dio = DioMock();
final datasource = GiphyDatasource(dio);

main(){
  test("Deve completar a request", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: jsonDecode(GifSearchDatasourceResponse), statusCode: 200));
    final result = datasource.gifSearch("finxiwars", 20, 0);
    expect(result, completes);
  });

  test("Deve retornar uma lista do tipo GifModel", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: jsonDecode(GifSearchDatasourceResponse), statusCode: 200));
    final result = datasource.gifSearch("searchText", 20, 0);
    expect(result, isA<Future<List<GifModel>>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: null, statusCode: 401));
    final result = datasource.gifSearch("searchText", 20, 0);
    expect(result, throwsA(isA<DataSourceError>()));
  });
}