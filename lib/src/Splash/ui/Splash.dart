import 'dart:async';
import 'package:emart/src/Utils/EmartColor.dart';
import 'package:emart/src/Utils/EmartNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => EmartNavigator.goToLogin(context));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(EmartColor.appTheamColor);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                // flex: 2,
                child: Container(
                  color: EmartColor.bgColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage(
                            'assets/images/emart_appicon.png',
                          ),
                          height: 100.0,
                          width: 100.0,
                        ),
                      ),
                      //Image.asset('assets/images/appicon.png', height: 100, width: 100),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Emart',
                              style: TextStyle(
                                color: Color(0xff444444),
                                fontSize: 40,
                                fontFamily: 'AllerBold',
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
