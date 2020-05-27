import 'dart:convert';

import 'package:emart/src/Constants/EmartApi.dart';
import 'package:emart/src/Constants/EmartError.dart';
import 'package:emart/src/Login/data/model/LoginResponseModel.dart';
import 'package:emart/src/NetworkCall/FutureCallToServer.dart';
import 'package:emart/src/Utils/Validation.dart';
import 'package:emart/src/Utils/ValidationItem.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {


  LoginResponseModel user;
  String errorMessage;
  bool loading = false;

  ValidationItem _emailId = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  static bool loginValidated;

  // Getter
  ValidationItem get emailId => _emailId;

  ValidationItem get password => _password;
/*
  void submitData(BuildContext context){
    print("emailId= ${emailId.value},Password=${password.value}");

    //loginValidated = true;
   // notifyListeners();

  }*/
  bool get isValid{
    if(_emailId.value!=null && _password.value != null)
      return true;
    else
    if (_emailId.value == null)
      _emailId =
          ValidationItem(null, EmartError.uiError["fieldsSholdNotBeEmpty"]);
    if (_password.value == null)
      _password =
          ValidationItem(null, EmartError.uiError["fieldsSholdNotBeEmpty"]);
        notifyListeners();
    return false;
  }
  // Setter
  void validateEmailId(String value) {
    if (Validation.isEmailValid(value)) {
      _emailId = ValidationItem(value, null);
    } else {
      _emailId = ValidationItem(value, EmartError.uiError["emailValidationError"]);
    }
    notifyListeners();
  }

  void validatePassword(String value) {
    if (value.length >= 6) {
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(value, EmartError.uiError["passLengthValidationError"]);
    }
    notifyListeners();
  }

  Future<bool> getUserData() async {
    Map data =
   // {"email":"jatashankar@wisepromo.com", "password": "000000"};
    {
      "email": _emailId.value,
      "password": _password.value,
    };
    //encode Map to JSON
    var body = json.encode(data);
    setLoading(true);
    try {
      var result = await FutureCallToServer.requestToServer<LoginResponseModel, Null>(body, EmartApi.login);
      setLoading(false);
      setUser(result);
      print("RESULT="+result.message);
    }
    catch(e){
      setLoading(false);
    }

    return isUser();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  LoginResponseModel getUSer() {
    return user;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  bool isUser() {
    return user != null ? true : false;
  }
}
