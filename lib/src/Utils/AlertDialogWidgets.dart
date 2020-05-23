import 'package:emart/src/Utils/EmartColor.dart';
import 'package:emart/src/Utils/EmartNavigator.dart';
import 'package:emart/src/Utils/EmartString.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogWidgets{
  static Future  showAlertWithTwoButtons(BuildContext context, String from, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(EmartString.sent),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: const Text('Cancel',
                style: TextStyle(
                  color: Colors.black45,
                  fontFamily: 'AllerBold',
                  fontSize: 20
                ),),
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
              ),
              FlatButton(
                child: const Text('Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'AllerBold',
                    color: EmartColor.appTheamColor,
                  ),),
                onPressed: () {
                  if (from == "REG") {
                    Navigator.of(context).pop(context);
                    EmartNavigator.goToLogin(context);
                  }
                  else
                    Navigator.of(context).pop(context);
                },
              )
            ],
          );
        }
    );
  }
}