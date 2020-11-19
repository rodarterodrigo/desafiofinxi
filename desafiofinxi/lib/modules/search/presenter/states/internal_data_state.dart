import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/domain/errors/errors.dart';
import 'package:equatable/equatable.dart';

abstract class InternalDataState extends Equatable {
  const InternalDataState();
}

class EmptyState extends InternalDataState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class InitialState extends InternalDataState {
  const InitialState();
  @override
  List<Object> get props => [];
}

class LoadingState extends InternalDataState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class DeleteSucessState extends InternalDataState {
  final int id;
  const DeleteSucessState(this.id);
  @override
  List<Object> get props => [id];
}

class LoadedSucessState extends InternalDataState {
  final List<Gif> gifList;
  const LoadedSucessState(this.gifList);
  @override
  List<Object> get props => [gifList];
}

class InsertSucessState extends InternalDataState {
  final int id;
  const InsertSucessState(this.id);
  @override
  List<Object> get props => [id];
}

class UpdateSucessState extends InternalDataState {
  final int id;
  const UpdateSucessState(this.id);
  @override
  List<Object> get props => [id];
}

class ErrorState extends InternalDataState {
  final FailureSearch failureSearch;
  const ErrorState(this.failureSearch);
  @override
  List<Object> get props => [failureSearch];
}