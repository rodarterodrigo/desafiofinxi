import 'package:desafiofinxi/modules/search/presenter/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
class GifEditColum extends StatefulWidget {

  final TextEditingController name;
  final TextEditingController author;
  final TextEditingController originalImage;
  final TextEditingController downsizedImage;
  final TextEditingController url;

  GifEditColum({this.name, this.author, this.originalImage, this.downsizedImage, this.url});
  @override
  _GifEditColumState createState() => _GifEditColumState();
}

class _GifEditColumState extends State<GifEditColum> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomTextField(
            labelText: "Nome",
            controller: widget.name,
            isAutoFocus: true,
            hint: "Name",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomTextField(
            labelText: "Autor",
            controller: widget.author,
            isAutoFocus: true,
            hint: "Author",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomTextField(
            labelText: "Imagem original",
            controller: widget.originalImage,
            isAutoFocus: true,
            hint: "originalImage",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomTextField(
            labelText: "Qualidade reduzida",
            controller: widget.downsizedImage,
            isAutoFocus: true,
            hint: "downsizedImage",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomTextField(
            labelText: "Giphy Link",
            controller: widget.url,
            isAutoFocus: true,
            hint: "url",
          ),
        ),
      ],
    );
  }
}
