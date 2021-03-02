import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class MapIndexEvent extends HomeEvent {
  final int index;
  const MapIndexEvent(this.index);
  @override
  List<Object> get props => [index];
}

class MapSearchEvent extends HomeEvent {
  final String search;
  const MapSearchEvent(this.search);
  @override
  List<Object> get props => [search];
}
