import 'package:desafiofinxi/modules/search/presenter/errors/errors.dart';

abstract class INavigationState{}

class IndexSuccess implements INavigationState{
  final int index;
  IndexSuccess({this.index});
}

class SearchSuccess implements INavigationState{
  final String search;
  SearchSuccess({this.search});
}

class SearchError implements INavigationState{
  final StringSearchError stringSearchError;
  SearchError(this.stringSearchError);
}

class IndError implements INavigationState{
  final IndexError indexError;
  IndError(this.indexError);
}

class IndexStart implements INavigationState{}