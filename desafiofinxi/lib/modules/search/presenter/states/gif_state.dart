import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:equatable/equatable.dart';

abstract class GifState extends Equatable {
  const GifState();
}

class EmptyState extends GifState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class InitialState extends GifState {
  const InitialState();
  @override
  List<Object> get props => [];
}

class LoadingState extends GifState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class LoadedSucessState extends GifState {
  final List<Gif> gifList;
  const LoadedSucessState(this.gifList);
  @override
  List<Object> get props => [gifList];
}

class ErrorState extends GifState {
  final FailureSearch failureSearch;
  const ErrorState(this.failureSearch);
  @override
  List<Object> get props => [failureSearch];
}