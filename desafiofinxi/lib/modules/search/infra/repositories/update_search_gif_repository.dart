import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/update_gif_repository.dart';
import 'package:desafiofinxi/modules/search/internaldata/repositories/gif_crud.dart';

class UpdateGifRepository implements IUpdateGifRepository{
  final GifCrud datasource;

  UpdateGifRepository(this.datasource):assert(datasource != null);

  @override
  Future<Either<FailureSearch, int>> updateGif(Gif gif, int id) async{
    try{
      return gif == null? Left(DataSourceError(message: "A entidade não pode ser nula")): Right(await datasource.updateGif(gif, id));
    }
    on DataSourceError catch(Exception){
      return Left(Exception);
    }
    catch(e){
      return Left(DataSourceError(message: "Algo errado ocorreu"));
    }
  }
}