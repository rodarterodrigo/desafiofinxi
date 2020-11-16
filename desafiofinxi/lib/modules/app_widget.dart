import 'package:desafiofinxi/modules/search/presenter/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: "Luls Wars",
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromRGBO(255, 173, 1, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      darkTheme:  ThemeData(
        primaryColor: Color.fromRGBO(29, 29, 36, 1),
        accentColor: Color.fromRGBO(255, 173, 1, 1),
        scaffoldBackgroundColor: Color.fromRGBO(20, 20, 26, 1),
        cardColor: Color.fromRGBO(45, 45, 55, 1),
        errorColor: Color.fromRGBO(255, 77, 106, 1),
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: Modular.initialRoute,
      home: SplashPage(),
      onGenerateRoute: Modular.generateRoute,
    );
  }
}