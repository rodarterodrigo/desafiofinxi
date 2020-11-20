import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/save_gif_repository.dart';

abstract class ISaveSearchGif{
  Future<Either<FailureSearch, int>>postGif(Gif gif);
}

class SaveSearchGif implements ISaveSearchGif{
  final ISaveGifRepository repository;

  SaveSearchGif(this.repository):assert(repository != null);

  @override
  Future<Either<FailureSearch, int>> postGif(Gif gif) async{
    try{
      return gif == null? Left(InvalidEntityError(message: "A entidade não pode ser nula")): await repository.postGif(gif);
    }
    catch(e){
      return Left(InvalidEntityError(message: e.toString()));
    }
  }
}