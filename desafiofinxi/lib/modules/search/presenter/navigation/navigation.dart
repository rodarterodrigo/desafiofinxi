import 'package:desafiofinxi/modules/search/presenter/views/gif_library_page.dart';
import 'package:desafiofinxi/modules/search/presenter/views/start_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class INavigation {
  Widget viewList(int index, String search);
  List<BottomNavigationBarItem> bottonNavigation();
}

class Navigation implements INavigation {
  @override
  Widget viewList(int index, String search) {
    List<Widget> views = [
      StartPage(searchGif: search),
      null,
      GifLibraryPage(),
    ];
    return views[index];
  }

  @override
  List<BottomNavigationBarItem> bottonNavigation() => [
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          label: "Início",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          label: "Busca",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          label: "Biblioteca",
          icon: Icon(Icons.photo_library),
        ),
      ];
}
