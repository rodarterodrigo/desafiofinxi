import 'package:desafiofinxi/modules/search/domain/usecases/search_gif_by_text.dart';
import 'package:desafiofinxi/modules/search/external/datasources/giphy_datasource.dart';
import 'package:desafiofinxi/modules/search/infra/repositories/gif_search_repository_impl.dart';
import 'package:desafiofinxi/modules/search/presenter/blocs/gif_bloc.dart';
import 'package:desafiofinxi/modules/search/presenter/views/home.dart';
import 'package:desafiofinxi/modules/search/presenter/views/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule{
  @override
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => GiphyDatasource(i())),
    Bind((i) => GifSearchRepository(i())),
    Bind((i) => SearchGifByText(i())),
    Bind((i) => GifBloc(i())),
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (context, args) => SplashScreen()),
    ModularRouter("/home", child: (context, args) => Home(),),
  ];

}