import 'package:desafiofinxi/modules/search/presenter/blocs/navigation_bloc.dart';
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
  final navigationBloc = Modular.get<NavigationBloc>();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    navigationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: navigationBloc,
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
                onPressed: () async => navigationBloc.add(MapSearchEvent(await showSearch(context: context, delegate: CustomSearchDelegate()))),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: navigation.viewList(navigationBloc.index, navigationBloc.search),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:0,
            onTap: (ind) => navigationBloc.add(MapIndexEvent(ind)),
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.white,
            items: navigation.bottonNavigation(),
          ),
        );
      },
    );
  }
}