import 'package:desafiofinxi/modules/search/presenter/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 6,
            backgroundColor: Color.fromRGBO(20, 20, 26, 1),
            navigateAfterSeconds: Routes.HOME,
            loaderColor: Colors.transparent,
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              color: Colors.black,
              child: Center(
                child: Image.asset("lib/assets/images/intro.gif"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
