import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';

// ignore: must_be_immutable
class GifModel extends Gif {
  GifModel({id, giphyId, name, author, originalImage, downsizedImage, url})
      : super(
            id: id,
            giphyId: giphyId,
            name: name,
            author: author,
            originalImage: originalImage,
            downsizedImage: downsizedImage,
            url: url);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "giphyId": giphyId,
      "name": name,
      "author": author,
      "original_image": originalImage,
      "downsized_image": downsizedImage,
      "url": url,
    };
  }

  static GifModel fromDb(Map<String, dynamic> map) {
    if (map == null) return null;
    return GifModel(
      id: map['id'],
      giphyId: map['giphyId'],
      name: map['name'],
      author: map['author'],
      originalImage: map['original_image'],
      downsizedImage: map['downsized_image'],
      url: map['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": giphyId,
      "title": name,
      "username": author,
      "url": url,
      "images": {
        "original": {"url": originalImage},
        "downsized": {"url": downsizedImage}
      },
    };
  }

  static GifModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return GifModel(
      id: null,
      giphyId: map['id'],
      name: map['title'],
      author: map['username'],
      originalImage: map['images']['original']['url'],
      downsizedImage: map['images']['downsized']['url'],
      url: map['url'],
    );
  }

  static GifModel fromJson(dynamic map) {
    if (map == null) return null;
    return GifModel(
      id: null,
      giphyId: map['id'],
      name: map['title'],
      author: map['username'],
      originalImage: map['images']['original']['url'],
      downsizedImage: map['images']['downsized']['url'],
      url: map['url'],
    );
  }
}
