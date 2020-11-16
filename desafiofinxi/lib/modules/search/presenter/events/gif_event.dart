import 'package:equatable/equatable.dart';

abstract class GifEvent extends Equatable {
  const GifEvent();
}

class SearchGifEvent extends GifEvent {
  final String searchText;
  SearchGifEvent(this.searchText);
  @override
  // TODO: implement props
  List<Object> get props => [searchText];
}