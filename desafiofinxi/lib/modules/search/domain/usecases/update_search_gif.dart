import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/update_gif_repository.dart';

abstract class IUpdateSearchGif{
  Future<Either<FailureSearch, int>>updateGif(Gif gif);
}

class UpdateSearchGif implements IUpdateSearchGif{
  final IUpdateGifRepository repository;

  UpdateSearchGif(this.repository):assert(repository != null);

  @override
  Future<Either<FailureSearch, int>> updateGif(Gif gif) async{
    try{
      return gif == null? Left(InvalidEntityError(message: "A entidade não pode ser nula")): await repository.updateGif(gif);
    }
    catch(e){
      return Left(InvalidEntityError(message: e.toString()));
    }
  }
}