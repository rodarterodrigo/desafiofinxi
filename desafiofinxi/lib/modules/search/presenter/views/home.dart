import 'package:desafiofinxi/modules/search/presenter/blocs/navigation_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/navigation/navigation.dart';
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
                onPressed: () async => await showSearch(context: context, delegate: null),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: navigation.viewList(navigationBloc.index, "star wars"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:0,
            onTap: (ind) => navigationBloc.add(ind),
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.white,
            items: navigation.bottonNavigation(),
          ),
        );
      },
    );
  }
}