import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{
  const NavigationEvent();
}

class MapIndexEvent extends NavigationEvent{
  final int index;
  const MapIndexEvent(this.index);
  @override
  // TODO: implement props
  List<Object> get props => [index];
}

class MapSearchEvent extends NavigationEvent{
  final String search;
  const MapSearchEvent(this.search);
  @override
  // TODO: implement props
  List<Object> get props => [search];
}