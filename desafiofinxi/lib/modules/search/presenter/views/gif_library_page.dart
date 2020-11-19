import 'package:desafiofinxi/modules/search/presenter/blocs/library_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/events/internal_data_events.dart';
import 'package:desafiofinxi/modules/search/presenter/routes/app_pages.dart';
import 'package:desafiofinxi/modules/search/presenter/states/internal_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class GifLibraryPage extends StatefulWidget {
  @override
  _GifLibraryPageState createState() => _GifLibraryPageState();
}

class _GifLibraryPageState extends State<GifLibraryPage> {
  final libraryBloc = Modular.get<LibraryBloc>();

  @override
  void initState(){
    libraryBloc.add(GetAllGifEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        initialData: LoadingState,
        stream: libraryBloc,
        builder: (context, snapshot){
          final state = libraryBloc.state;
          if(state is ErrorState) return Center();
          if(state is ErrorState) return Center(child: Text(state.failureSearch.message),);
          if(state is LoadingState) return Center(child: CircularProgressIndicator());
          else {
            final list = (state as LoadedSucessState).gifList;
            return Scaffold(
              body:  list.length > 0? GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(list.length, (index) {
                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        // height: MediaQuery.of(context).size.height /3,
                        // width: MediaQuery.of(context).size.height /2,
                        child: Hero(
                            tag: list[index].downsizedImage,
                            child: Image.network(list[index].downsizedImage, fit: BoxFit.fill,)
                        ),
                      ),
                      onTap: () => Modular.to.pushNamed(Routes.GIFDETAILPAGE,arguments: list[index]),
                    );
                  }
                  )
              )
                  :Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/4,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.amber, width: 4),
                    ),
                    child: Image.asset("lib/assets/images/palpatine.gif"),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Sem Gifs salvos, o universo irá perecer nas mãos do Senhor do Mal :(",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}