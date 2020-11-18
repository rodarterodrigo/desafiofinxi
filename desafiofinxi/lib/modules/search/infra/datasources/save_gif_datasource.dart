import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';

abstract class ISaveGifSearchDatasource{
  Future<int> postGif(GifModel gif);
}