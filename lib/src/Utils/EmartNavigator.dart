import 'package:flutter/material.dart';

class EmartNavigator {

  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
  static void goToRegistration(BuildContext context) {
    Navigator.pushNamed(context, "/registration");
  }
}