import 'package:desafiofinxi/modules/search/presenter/blocs/gif_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/events/gif_event.dart';
import 'package:desafiofinxi/modules/search/presenter/states/gif_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class StartPage extends StatefulWidget {
  String searchGif;
  StartPage({this.searchGif = "star wars"});
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  final gifBloc = Modular.get<GifBloc>();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    gifBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    gifBloc.add(SearchGifEvent(widget.searchGif));
    return StreamBuilder(
      initialData: LoadingState,
      stream: gifBloc,
      builder: (context, snapshot){
        final state = gifBloc.state;
        if(state is ErrorState) return Center(child: Text(state.failureSearch.message),);
        if(state is LoadingState) return Center(child: CircularProgressIndicator());
        else {
          final list = (state as LoadedSucessState).gifList;
          return Scaffold(
            appBar: AppBar(
              title: Text("Giphy Wars"),
            ),
            body:  Container(
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(list.length, (index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height /3,
                      width: MediaQuery.of(context).size.height /2,
                      child: Image.network(list[index].image, fit: BoxFit.fill,),
                    );
                  }
                  )
              ),
            ),
          );
        }
      },
    );
  }
}