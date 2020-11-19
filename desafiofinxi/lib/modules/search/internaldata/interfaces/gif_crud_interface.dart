import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';

abstract class IGifCrud{
  Future<List<GifModel>> getAllGifs();
  Future<int> insertGif(GifModel gif);
  Future<GifModel> getGif(int id);
  Future<int> updateGif(GifModel gif);
  Future deleteGif(int id);
}