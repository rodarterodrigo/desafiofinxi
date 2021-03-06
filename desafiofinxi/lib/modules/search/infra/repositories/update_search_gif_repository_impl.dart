import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/update_gif_repository.dart';
import 'package:desafiofinxi/modules/search/internaldata/interfaces/gif_crud_interface.dart';

class UpdateGifRepository implements IUpdateGifRepository{
  final IGifCrud datasource;

  UpdateGifRepository(this.datasource):assert(datasource != null);

  @override
  Future<Either<FailureSearch, int>> updateGif(Gif gif) async{
    try{
      return gif == null? Left(DataSourceError(message: "A entidade não pode ser nula")): Right(await datasource.updateGif(gif));
    }
    on DataSourceError catch(Exception){
      return Left(Exception);
    }
    catch(e){
      return Left(DataSourceError(message: e.toString()));
    }
  }
}