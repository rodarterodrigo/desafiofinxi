import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';

class GifModel extends Gif{
  GifModel({id, name, image}):super(id: id, name: name, image: image);

  Map<String, dynamic> toMap(){
    return{
      "id":id,
      "name":name,
      "image":image,
    };
  }

  static GifModel fromMap(Map<String, dynamic> map){
    if(map == null) return null;
    return GifModel(
      id:map['id'],
      name:map['title'],
      image: map['images']['original']['url'],
    );
  }

  static GifModel fromJson(dynamic map){
    if(map == null) return null;
    return GifModel(
      id:map['id'],
      name:map['title'],
      image: map['images']['original']['url'],
    );
  }
}