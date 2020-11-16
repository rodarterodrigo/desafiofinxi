import 'package:desafiofinxi/modules/search/presenter/errors/errors.dart';

abstract class INavigationState{}

class IndexSuccess implements INavigationState{
  final int index;
  IndexSuccess({this.index});
}

class IndError implements INavigationState{
  final IndexError indexError;
  IndError(this.indexError);
}

class IndexStart implements INavigationState{}