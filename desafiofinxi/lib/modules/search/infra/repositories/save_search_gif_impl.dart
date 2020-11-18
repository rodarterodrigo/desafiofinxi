import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/save_gif_repository.dart';
import 'package:desafiofinxi/modules/search/internaldata/interfaces/gif_crud_interface.dart';

class SaveGifRepository implements ISaveGifRepository{
  final IGifCrud datasource;

  SaveGifRepository(this.datasource):assert(datasource != null);

  @override
  Future<Either<FailureSearch, int>> postGif(Gif gif) async{
    try{
      return gif == null? Left(DataSourceError(message: "A entidade não pode ser nula")): Right(await datasource.insertGif(gif));
    }
    on DataSourceError catch(Exception){
    return Left(Exception);
    }
    catch(e){
    return Left(DataSourceError(message: e.toString()));
    }
  }
}