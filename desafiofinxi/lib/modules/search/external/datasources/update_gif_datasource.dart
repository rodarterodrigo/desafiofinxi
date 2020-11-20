import 'dart:convert';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/external/constants/settings.dart';
import 'package:desafiofinxi/modules/search/infra/datasources/update_gif_datasource.dart';
import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';
import 'package:dio/dio.dart';

class UpdateGifDataSource implements IUpdateGifSearchDatasource{
  final Dio dio;

  UpdateGifDataSource(this.dio):assert(dio != null);

  @override
  Future<int> postGif(GifModel gif) async{
    final response = await dio.put(Settings.baseUrlPrefix +"?api_key=${Settings.giphyApiKey}&id=${gif.giphyId}", data: gif.toJson());

    return response.statusCode == 200? jsonDecode(response.data): throw DataSourceError(message: "Erro na requisição");
  }
}