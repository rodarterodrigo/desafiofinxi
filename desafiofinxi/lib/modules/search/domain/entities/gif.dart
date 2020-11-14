import 'package:equatable/equatable.dart';

class Gif extends Equatable{
  final String name;
  final String image;

  Gif({this.name, this.image});

  @override
  // TODO: implement props
  List<Object> get props => [
    name,
    image,
  ];
}