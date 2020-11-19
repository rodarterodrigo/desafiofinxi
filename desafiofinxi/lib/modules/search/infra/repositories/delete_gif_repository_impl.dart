import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/delete_gif_repository.dart';
import 'package:desafiofinxi/modules/search/internaldata/interfaces/gif_crud_interface.dart';

class DeleteGifRepository implements IDeleteGifRepository{
  final IGifCrud datasource;

  DeleteGifRepository(this.datasource):assert(datasource != null);

  @override
  Future<Either<FailureSearch, int>> deleteGifByiD(int id) async {
    try{
      return id == null? Left(DeleteGifDataSourceError()): Right(await datasource.deleteGif(id));
    }
    on DataSourceError catch(Exception){
    return Left(Exception);
    }
    catch(e){
    return Left(DeleteGifDataSourceError(message: e.toString()));
    }
  }
}