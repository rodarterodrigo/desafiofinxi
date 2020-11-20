import 'dart:convert';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/external/constants/settings.dart';
import 'package:desafiofinxi/modules/search/infra/datasources/delete_gif_datasource.dart';
import 'package:dio/dio.dart';

class DeleteGifDataSource implements IDeleteGifSearchDatasource{
  final Dio dio;

  DeleteGifDataSource(this.dio):assert(dio != null);

  @override
  Future<int> deleteGif(int id) async{
    final response = await dio.delete(Settings.baseUrlPrefix +"?api_key=${Settings.giphyApiKey}?id=${id}");

    return response.statusCode == 200? jsonDecode(response.data): throw DataSourceError();
  }
}