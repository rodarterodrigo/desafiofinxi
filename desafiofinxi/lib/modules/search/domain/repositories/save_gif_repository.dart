import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';

abstract class ISaveGifRepository{
  Future<Either<FailureSearch, int>> postGif (Gif gif);
}