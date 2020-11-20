import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/internal_data_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/library_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/widgets/custom_flutter_toast.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/widgets/custom_text_field.dart';
import 'package:desafiofinxi/modules/search/presenter/states/internal_data_state.dart';
import 'package:desafiofinxi/modules/search/presenter/events/internal_data_events.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/enums/buttom_style.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/widgets/custom_buttom.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/widgets/custom_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class GifDetailPage extends StatefulWidget {
  final Gif gif;

  GifDetailPage(this.gif):assert(gif != null);
  
  @override
  _GifDetailPageState createState() => _GifDetailPageState();
}

class _GifDetailPageState extends State<GifDetailPage> {
  final internalDataBloc = Modular.get<InternalDataBloc>();
  final libraryBloc = Modular.get<LibraryBloc>();

  TextEditingController name = new TextEditingController();
  TextEditingController author = new TextEditingController();
  TextEditingController originalImage = new TextEditingController();
  TextEditingController downsizedImage = new TextEditingController();
  TextEditingController url = new TextEditingController();

  @override
  void initState() {
    internalDataBloc.gif = widget.gif;
    name.text = widget.gif.name;
    author.text = widget.gif.author;
    originalImage.text = widget.gif.originalImage;
    downsizedImage.text = widget.gif.downsizedImage;
    url.text = widget.gif.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: internalDataBloc,
      builder:(context, snapshot) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Modular.to.pop(),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
            title: Text(internalDataBloc.gif.name),
          ),
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                  Hero(
                  tag: internalDataBloc.gif.downsizedImage.toString(),
                  child: Container(
                        child: CachedNetworkImage(imageUrl: internalDataBloc.gif.downsizedImage, fit: BoxFit.fill,),
                      ),
                  ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(8),
                  child: CustomExpansionTile(
                    expandedIconColor: Colors.amber,
                    backgroundColor: Theme.of(context).cardColor,
                    title: Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(internalDataBloc.gif.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text("Link original image:", style: TextStyle(color: Colors.amber,), textAlign: TextAlign.start,),
                                  SizedBox(height: 10,),
                                  Text(internalDataBloc.gif.originalImage),
                                  SizedBox(height: 20,),
                                  Text("Link downsized image:", style: TextStyle(color: Colors.amber,), textAlign: TextAlign.start,),
                                  SizedBox(height: 10,),
                                  Text(internalDataBloc.gif.downsizedImage),
                                  SizedBox(height: 20,),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                internalDataBloc.gif.id == null? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: CustomButton(onPressed: () => Modular.to.pop(), text: "Voltar", buttonStyle: CustomButtonStyle.Secondary,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: CustomButton(onPressed: () => internalDataBloc.add(SaveGifEvent(internalDataBloc.gif)), text: "Salvar", buttonStyle: CustomButtonStyle.Primary,),
                    ),
                  ],
                ):
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: CustomButton(onPressed: () => Modular.to.pop(), text: "Voltar", buttonStyle: CustomButtonStyle.Secondary,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: CustomButton(onPressed: () => internalDataBloc.add(DeleteGifEvent(internalDataBloc.gif.id)),
                        text: "Deletar", buttonStyle: CustomButtonStyle.Secondary,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: CustomButton(onPressed: () {
                        return Alert(
                            style: AlertStyle(
                              backgroundColor: Theme.of(context).primaryColor
                            ),
                            context: context,
                            title: "",
                            content: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: CustomTextField(
                                      labelText: "Nome",
                                      controller: name,
                                      isAutoFocus: true,
                                      hint: "Name",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: CustomTextField(
                                      labelText: "Autor",
                                      controller: author,
                                      isAutoFocus: true,
                                      hint: "Author",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: CustomTextField(
                                      labelText: "Imagem original",
                                      controller: originalImage,
                                      isAutoFocus: true,
                                      hint: "originalImage",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: CustomTextField(
                                      labelText: "Qualidade reduzida",
                                      controller: downsizedImage,
                                      isAutoFocus: true,
                                      hint: "downsizedImage",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: CustomTextField(
                                      labelText: "Giphy Link",
                                      controller: url,
                                      isAutoFocus: true,
                                      hint: "url",
                                  ),
                                ),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                onPressed: () {
                                  GifModel gif = GifModel(
                                    url: url.text,
                                    originalImage: originalImage.text,
                                    name: name.text,
                                    id: internalDataBloc.gif.id,
                                    downsizedImage: downsizedImage.text,
                                    author: author.text,
                                    giphyId: internalDataBloc.gif.giphyId
                                  );
                                  internalDataBloc.add(UpdateGifEvent(gif));
                                  internalDataBloc.gif = gif;
                                  libraryBloc.add(GetAllGifEvent());
                                  Modular.to.pop();
                                },
                                child: Text(
                                  "Editar",
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                ),
                              )
                            ]).show();
                      }, text: "Editar", buttonStyle: CustomButtonStyle.Primary,),
                    ),
                  ],
                ),
                StreamBuilder(stream: internalDataBloc, builder: (context, snapshot){
                    final state = internalDataBloc.state;
                    if(state is InitialState) return Center();
                    if(state is ErrorState) return Center(child: Text(state.failureSearch.message));
                    if(state is LoadingState) return Center(child: CircularProgressIndicator());
                    if(state is DeleteSucessState) {
                      final deletedId = (state as DeleteSucessState).id;
                      if(deletedId != internalDataBloc.deletedId){
                        CustomFlutterToast.alert("Gif removido com sucesso!");
                        internalDataBloc.deletedId = deletedId;
                      }
                      libraryBloc.add(GetAllGifEvent());
                    }
                    if(state is InsertSucessState){
                      final savedId = (state as InsertSucessState).id;
                      if(savedId != internalDataBloc.saveId) {
                        CustomFlutterToast.alert("Gif inserido com sucesso!");
                        internalDataBloc.saveId = savedId;
                      }
                    }
                    return Center();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}