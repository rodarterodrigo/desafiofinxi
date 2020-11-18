import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';

abstract class IUpdateGifSearchDatasource{
  Future<int> postGif(GifModel gif, int id);
}