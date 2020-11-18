import 'package:desafiofinxi/modules/search/domain/entities/gif.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/internal_data_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/states/internal_data_state.dart';
import 'package:desafiofinxi/modules/search/presenter/events/internal_data_events.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/enums/buttom_style.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/widgets/custom_buttom.dart';
import 'package:desafiofinxi/modules/search/presenter/shared/widgets/custom_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
class GifDetailPage extends StatefulWidget {
  final Gif gif;

  GifDetailPage(this.gif):assert(gif != null);
  
  @override
  _GifDetailPageState createState() => _GifDetailPageState();
}

class _GifDetailPageState extends State<GifDetailPage> {
  final saveGifBloc = Modular.get<InternalDataBloc>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Modular.to.pop(),
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(widget.gif.name),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
                Hero(
                tag: widget.gif.downsizedImage.toString(),
                child: Container(
                      child: Image.network(widget.gif.downsizedImage, fit: BoxFit.fill,),
                    ),
                ),
              SizedBox(height: 20,),
              Container(
                child: CustomExpansionTile(
                  expandedIconColor: Colors.amber,
                  backgroundColor: Theme.of(context).cardColor,
                  title: Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(widget.gif.name,
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
                                Text("Link original image: " + widget.gif.originalImage),
                                SizedBox(height: 20,),
                                Text("Link downsized image: " + widget.gif.downsizedImage),
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(onPressed: () => saveGifBloc.add(SaveGifEvent(widget.gif)), text: "Salvar", buttonStyle: CustomButtonStyle.Secondary,)
                                  ],
                                ),
                                StreamBuilder(stream: saveGifBloc, builder: (context, snapshot){
                                    final state = saveGifBloc.state;
                                    if(state is InitialState) return Center();
                                    if(state is ErrorState) return Center(child: Text(state.failureSearch.message));
                                    if(state is LoadingState) return Center(child: CircularProgressIndicator());
                                    else{
                                      final id = (state as InsertSucessState).id;
                                      if(id != null)
                                        Fluttertoast.showToast(
                                            msg: "Gif salvo com sucesso!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.black,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                    }
                                    return Center();
                                  },
                                ),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
