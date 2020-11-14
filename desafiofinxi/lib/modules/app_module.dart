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
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => throw AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (context, args) => SplashScreen()),
    ModularRouter("/home", child: (context, args) => Home(),),
  ];

}