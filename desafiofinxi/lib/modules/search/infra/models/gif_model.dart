import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';

class GifModel extends Gif{
  GifModel({id, name, author, originalImage, downsizedImage}):super(id: id, name: name, author: author, originalImage: originalImage, downsizedImage:downsizedImage);

  Map<String, dynamic> toMap(){
    return{
      "name":name,
      "author":author,
      "original_image":originalImage,
      "downsized_image":downsizedImage,
    };
  }

  static GifModel fromMap(Map<String, dynamic> map){
    if(map == null) return null;
    return GifModel(
      id:map['id'],
      name:map['title'],
      author: map['username'],
      originalImage: map['images']['original']['url'],
      downsizedImage: map['images']['downsized']['url'],
    );
  }

  static GifModel fromJson(dynamic map){
    if(map == null) return null;
    return GifModel(
      id:map['id'],
      name:map['title'],
      author: map['username'],
      originalImage: map['images']['original']['url'],
      downsizedImage: map['images']['downsized']['url'],
    );
  }
}