import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';

abstract class ISaveGifSearchDatasource{
  Future<int> postGif(Gif gif);
}