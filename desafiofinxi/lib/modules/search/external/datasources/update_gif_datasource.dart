import 'dart:convert';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/external/constants/settings.dart';
import 'package:desafiofinxi/modules/search/infra/datasources/update_gif_datasource.dart';
import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';
import 'package:dio/dio.dart';

class SaveGifDataSource implements IUpdateGifSearchDatasource{
  final Dio dio;

  SaveGifDataSource(this.dio):assert(dio != null);

  @override
  Future<int> postGif(GifModel gif, int id) async{
    final response = await dio.post(Settings.baseUrlPrefix +"?api_key=${Settings.giphyApiKey}?id=${id}", data: gif.toMap());

    return response.statusCode == 200? jsonDecode(response.data): throw DataSourceError(message: "Erro na requisição");
  }
}