import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/gif_search_repository.dart';
import 'package:desafiofinxi/modules/search/infra/datasources/gif_search_datasource.dart';

class GifSearchRepository implements IGifSearchRepository{
  final IGifSearchDatasource datasource;

  GifSearchRepository(this.datasource):assert(datasource != null);

  @override
  Future<Either<FailureSearch, List<Gif>>> searchGif(String searchText, int itensPerPage, int indexItem) async{
    try{
      return searchText == null? Left(DataSourceError(message: "A busca não pode ser nula")): Right(await datasource.gifSearch(searchText, itensPerPage, indexItem));
    }
    on DataSourceError catch(Exception){
    return Left(Exception);
    }
    catch(e){
    return Left(DataSourceError(message: e.toString()));
    }
  }
}