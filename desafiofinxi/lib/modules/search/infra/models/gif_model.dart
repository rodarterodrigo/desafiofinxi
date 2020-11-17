import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';

class GifModel extends Gif{
  GifModel({id, name, originalImage, downsizedImage}):super(id: id, name: name, originalImage: originalImage, downsizedImage:downsizedImage);

  Map<String, dynamic> toMap(){
    return{
      "id":id,
      "name":name,
      "originalImage":originalImage,
      "downsizedImage":downsizedImage
    };
  }

  static GifModel fromMap(Map<String, dynamic> map){
    if(map == null) return null;
    return GifModel(
      id:map['id'],
      name:map['title'],
      originalImage: map['images']['original']['url'],
      downsizedImage: map['images']['downsized']['url'],
    );
  }

  static GifModel fromJson(dynamic map){
    if(map == null) return null;
    return GifModel(
      id:map['id'],
      name:map['title'],
      originalImage: map['images']['original']['url'],
      downsizedImage: map['images']['downsized']['url'],
    );
  }
}