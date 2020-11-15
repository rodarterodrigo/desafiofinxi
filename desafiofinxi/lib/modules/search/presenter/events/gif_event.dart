import 'package:equatable/equatable.dart';

abstract class GifEvent extends Equatable {
  const GifEvent();
}

class LoadingSucessGifEvent extends GifEvent {
  final String searchText;
  LoadingSucessGifEvent(this.searchText);
  @override
  // TODO: implement props
  List<Object> get props => [];
}