import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class GifDetailPage extends StatefulWidget {
  final Gif gif;

  GifDetailPage(this.gif):assert(gif != null);
  
  @override
  _GifDetailPageState createState() => _GifDetailPageState();
}

class _GifDetailPageState extends State<GifDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Modular.to.pop(),
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(widget.gif.name),
      ),
      body: Center(
        child: Hero(
          tag: widget.gif.image.toString(),
          child: Container(
            child: Image.network(widget.gif.image, fit: BoxFit.fill,),
          ),
        ),
      ),
    );
  }
}
