import 'package:equatable/equatable.dart';

abstract class GifEvent extends Equatable {
  const GifEvent();
}

class SearchGifEvent extends GifEvent {
  final String searchText;
  final int itensPerPage;
  final int indexItem;
  const SearchGifEvent(this.searchText, this.itensPerPage, this.indexItem);

  @override
  // TODO: implement props
  List<Object> get props => [searchText];
}