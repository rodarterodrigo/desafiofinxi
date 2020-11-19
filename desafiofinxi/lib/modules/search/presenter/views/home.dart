import 'package:desafiofinxi/modules/search/presenter/blocs/internal_data_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/library_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/search_gif_by_text_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/home_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/events/navigation_event.dart';
import 'package:desafiofinxi/modules/search/presenter/navigation/navigation.dart';
import 'package:desafiofinxi/modules/search/presenter/search_delegate/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navigation = Modular.get<Navigation>();
  final homeBloc = Modular.get<HomeBloc>();
  final gifBloc = Modular.get<GifBloc>();
  final internalDataBloc = Modular.get<InternalDataBloc>();
  final libraryBloc = Modular.get<LibraryBloc>();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    homeBloc.close();
    gifBloc.close();
    internalDataBloc.close();
    libraryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: homeBloc,
        builder: (context, snapshot){
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
                opacity: 1,
              ),
              title: Text("Giphy Wars"),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async => homeBloc.add(MapSearchEvent(await showSearch(context: context, delegate: CustomSearchDelegate()))),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(16),
              child: navigation.viewList(homeBloc.index, homeBloc.search),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              selectedLabelStyle: TextStyle(fontSize: 12),
              currentIndex:homeBloc.index,
              onTap: (ind) async => ind != 1? homeBloc.add(MapIndexEvent(ind)):
              homeBloc.add(MapSearchEvent(await showSearch(context: context, delegate: CustomSearchDelegate()))),
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.white,
              items: navigation.bottonNavigation(),
            ),
          );
        },
      ),
    );
  }
}