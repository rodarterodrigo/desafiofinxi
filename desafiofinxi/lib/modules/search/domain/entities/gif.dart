import 'package:equatable/equatable.dart';

class Gif extends Equatable{
  final String id;
  final String name;
  final String image;

  Gif({this.id, this.name, this.image});

  @override
  // TODO: implement props
  List<Object> get props => [
    id,
    name,
    image,
  ];
}