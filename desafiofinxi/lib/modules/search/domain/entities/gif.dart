import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Gif extends Equatable {
  int id;
  final String giphyId;
  final String name;
  final String author;
  final String originalImage;
  final String downsizedImage;
  final String url;

  Gif(
      {this.id,
      this.giphyId,
      this.name,
      this.author,
      this.originalImage,
      this.downsizedImage,
      this.url});

  @override
  List<Object> get props => [
        id,
        giphyId,
        name,
        author,
        originalImage,
        downsizedImage,
        url,
      ];
}
