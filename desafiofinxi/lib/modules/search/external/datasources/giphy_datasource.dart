import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/infra/datasources/gif_search_datasource.dart';
import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';
import 'package:desafiofinxi/modules/search/external/constants/settings.dart';
import 'package:dio/dio.dart';

class GiphyDatasource implements IGifSearchDatasource{
  final Dio dio;

  GiphyDatasource(this.dio):assert(dio != null);

  @override
  Future<List<GifModel>> gifSearch(String searchText) async{

    final response = await dio.get(Settings.baseUrlPrefix +"?api_key=${Settings.giphyApiKey}&q=${searchText}");

    return response.statusCode == 200? (response.data['data'] as List).map((map) => GifModel.fromMap(map)).toList(): throw DataSourceError();
  }
}