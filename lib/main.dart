import 'package:emart/src/Login/ui/LoginScreen.dart';
import 'package:emart/src/Splash/ui/Splash.dart';
import 'package:emart/src/UserRegistration/ui/RegistrationScreen.dart';
import 'package:emart/src/Utils/EmartColor.dart';
import 'package:emart/src/Utils/EmartString.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // FlutterStatusbarcolor.setStatusBarColor(colorCustom);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("main fun");
    return MaterialApp(
      title: EmartString.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: EmartColor.appTheamColor,
        accentColor: EmartColor.appTheamColor,
        textTheme: TextTheme(
          title: TextStyle(fontFamily: 'AllerRegular'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: new Splash(),
      routes: routes,
    );
  }
}

var routes = <String, WidgetBuilder>{
  "/splash": (BuildContext context) => Splash(),
  "/login": (BuildContext context) => LoginScreen(),
  "/registration": (BuildContext context) => RegistrationScreen(),
};
