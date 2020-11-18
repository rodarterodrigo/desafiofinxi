import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';

abstract class IUpdateSearchGif{
  Future<Either<FailureSearch, int>>updateGif(Gif gif, int id);
}

class SaveSearchGif implements IUpdateSearchGif{
  final IUpdateSearchGif repository;

  SaveSearchGif(this.repository):assert(repository != null);

  @override
  Future<Either<FailureSearch, int>> updateGif(Gif gif, int id) async{
    try{
      return gif == null? Left(InvalidEntityError(message: "A entidade não pode ser nula")): await repository.updateGif(gif, id);
    }
    catch(e){
      return Left(InvalidEntityError(message: "A entidade não pode ser nula"));
    }
  }
}