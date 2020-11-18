import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/save_gif_repository.dart';
import 'package:desafiofinxi/modules/search/internaldata/repositories/gif_crud.dart';

class SaveGifRepository implements ISaveGifRepository{
  final GifCrud datasource;

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
    return Left(DataSourceError(message: "Algo errado ocorreu"));
    }
  }
}