import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:equatable/equatable.dart';

abstract class InternalDataEvents extends Equatable {
  const InternalDataEvents();
}

class GetAllGifEvent extends InternalDataEvents {
  @override
  List<Object> get props => [];
}

class SaveGifEvent extends InternalDataEvents {
  final Gif gif;
  const SaveGifEvent(this.gif);
  @override
  List<Object> get props => [gif];
}

class UpdateGifEvent extends InternalDataEvents {
  final Gif gif;
  const UpdateGifEvent(this.gif);
  @override
  List<Object> get props => [gif];
}

class DeleteGifEvent extends InternalDataEvents {
  final int id;
  const DeleteGifEvent(this.id);
  @override
  List<Object> get props => [id];
}
