import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';

abstract class IGifSearchDatasource{
  Future<List<GifModel>> gifSearch(String searchText);
}