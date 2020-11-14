import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/gif_search_repository.dart';
import 'package:desafiofinxi/modules/search/infra/datasources/gif_search_datasource.dart';

class GifSearchRepository implements IGifSearchRepository{
  final IGifSearchDatasource datasource;

  GifSearchRepository(this.datasource);

  @override
  Future<Either<FailureSearch, List<Gif>>> searchGif(String searchText) async{
    try{
      return searchText == null? Left(DataSourceError()): Right(await datasource.gifSearch(searchText));
    }
    on DataSourceError catch(Exception){
    return Left(Exception);
    }
    catch(e){
    return Left(DataSourceError(message: e));
    }
  }
}