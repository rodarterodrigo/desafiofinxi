import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';

class GifModel extends Gif{
  GifModel({id, giphyId, name, author, originalImage, downsizedImage, url})
      :super(id: id, giphyId: giphyId, name: name, author: author, originalImage: originalImage, downsizedImage:downsizedImage, url: url);

  Map<String, dynamic> toMap(){
    return{
      "id":id,
      "giphyId":giphyId,
      "name":name,
      "author":author,
      "original_image":originalImage,
      "downsized_image":downsizedImage,
      "url":url,
    };
  }

  static GifModel fromMap(Map<String, dynamic> map){
    if(map == null) return null;
    return GifModel(
      id: null,
      giphyId:map['id'],
      name:map['title'],
      author: map['username'],
      originalImage: map['images']['original']['url'],
      downsizedImage: map['images']['downsized']['url'],
      url: map['url'],
    );
  }

  static GifModel fromJson(dynamic map){
    if(map == null) return null;
    return GifModel(
      id: null,
      giphyId:map['id'],
      name:map['title'],
      author: map['username'],
      originalImage: map['images']['original']['url'],
      downsizedImage: map['images']['downsized']['url'],
      url: map['url'],
    );
  }
}