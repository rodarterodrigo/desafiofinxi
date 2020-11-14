import 'package:dartz/dartz.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:desafiofinxi/modules/search/domain/repositories/gif_search_repository.dart';

abstract class ISearchGifByText{
  Future<Either<FailureSearch, List<Gif>>>searchGif(String searchText);
}

class SearchGifByText implements ISearchGifByText{
  final IGifSearchRepository repository;

  SearchGifByText(this.repository):assert(repository != null);

  @override
  Future<Either<FailureSearch, List<Gif>>> searchGif(String searchText) async{
    try {
      return searchText == null? Left(InvalidTextError()): await repository.searchGif(searchText);
    }
    catch(e){
      return Left(InvalidTextError(message: e));
    }
  }
}