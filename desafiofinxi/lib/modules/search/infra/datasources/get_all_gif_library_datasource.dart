import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';

abstract class IGetAllGifLibraryDatasource{
  Future<List<GifModel>> gifSearch();
}