import 'package:equatable/equatable.dart';

class Gif extends Equatable{
  final String id;
  final String name;
  final String originalImage;
  final String downsizedImage;
  final String url;

  Gif({this.id, this.name, this.originalImage, this.downsizedImage, this.url});

  @override
  // TODO: implement props
  List<Object> get props => [
    id,
    name,
    originalImage,
    downsizedImage
  ];
}