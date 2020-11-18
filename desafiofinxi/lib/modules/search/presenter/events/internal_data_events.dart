import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:equatable/equatable.dart';

abstract class InternalDataEvents extends Equatable {
  const InternalDataEvents();
}

class SaveGifEvent extends InternalDataEvents {
  final Gif gif;
  const SaveGifEvent(this.gif);
  @override
  // TODO: implement props
  List<Object> get props => [gif];
}