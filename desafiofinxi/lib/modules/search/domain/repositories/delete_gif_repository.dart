import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';

abstract class IDeleteGifRepository{
Future<Either<FailureSearch, int>> deleteGifByiD (int id);
}