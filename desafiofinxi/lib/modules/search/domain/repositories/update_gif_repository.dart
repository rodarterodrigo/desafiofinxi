import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';

abstract class IUpdateGifRepository{
  Future<Either<FailureSearch, int>> updateGif (Gif gif, int id);
}