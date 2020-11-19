import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/get_all_gif_repository.dart';
import 'package:desafiofinxi/modules/search/internaldata/interfaces/gif_crud_interface.dart';

class GetAllGifRepository implements IGetAllGifRepository{
  final IGifCrud datasource;

  GetAllGifRepository(this.datasource):assert(datasource != null);

  @override
  Future<Either<FailureSearch, List<Gif>>> getAllGif() async{
    try{
      return Right(await datasource.getAllGifs());
    }
    on DataSourceError catch(Exception){
      return Left(Exception);
    }
    catch(e){
      return Left(DataSourceError(message: e.toString()));
    }
  }
}