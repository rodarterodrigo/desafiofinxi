import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/get_all_gif_repository.dart';

abstract class IGetSearchGifLibrary{
  Future<Either<FailureSearch, List<Gif>>>getAllGifLibrary();
}

class GetSearchGifLibrary implements IGetSearchGifLibrary{
  final IGetAllGifRepository repository;

  GetSearchGifLibrary(this.repository):assert(repository != null);

  @override
  Future<Either<FailureSearch, List<Gif>>> getAllGifLibrary() async{
    try {
      return await repository.getAllGif();
    }
    catch(e){
      return Left(InvalidTextError(message: e.toString()));
    }
  }
}