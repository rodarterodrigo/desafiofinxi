import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';

class GifModel extends Gif{
  GifModel({name, image}):super(name: name, image: image,);

  Map<String, dynamic> toMap(){
    return{
      "name":name,
      "image":image,
    };
  }

  static GifModel fromMap(Map<String, dynamic> map){
    if(map == null) return null;
    return GifModel(
      name:map['name'],
      image: map['image'],
    );
  }

  static GifModel toJson(dynamic map){
    if(map == null) return null;
    return GifModel(
      name:map['name'],
      image: map['image'],
    );
  }
}