import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';

abstract class IGifSearchRepository{
  Future<Either<FailureSearch, List<Gif>>> searchGif (String searchText, int itensPerPage, int indexItem);
}