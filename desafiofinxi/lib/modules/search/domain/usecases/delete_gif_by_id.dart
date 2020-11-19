import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/delete_gif_repository.dart';

abstract class IDeleteGifById{
  Future<Either<FailureSearch, int>> deleteGifByiD (int id);
}

class DeleteGifById implements IDeleteGifById{
  final IDeleteGifRepository repository;
  DeleteGifById(this.repository);

  @override
  Future<Either<FailureSearch, int>> deleteGifByiD(int id) async {
    // TODO: implement deleteGifByiD
    try {
      return id == null? Left(DeleteGifError()): await repository.deleteGifByiD(id);
    }
    catch(e){
      return Left(DeleteGifError(message: e.toString()));
    }
  }
}