import 'package:emart/src/Login/data/model/LoginValidationItem.dart';
import 'package:flutter/material.dart';

class RegistrationValidation extends ChangeNotifier {

  LoginValidationItem _userName = LoginValidationItem(null, null);
  LoginValidationItem _password = LoginValidationItem(null, null);

  // Getter
  LoginValidationItem get userName => _userName;

  LoginValidationItem get password => _password;

  void submitData(BuildContext context){
    print("userName= ${userName.value},Password=${password.value}");

  }
  bool get isValid{
    if(_userName.value!=null && _password.value != null)
      return true;
    else
      return false;
  }
  // Setter
  void changeUserName(String value) {
    if (value.contains("@")) {
      _userName = LoginValidationItem(value, null);
    } else {
      _userName = LoginValidationItem(null, "Email Id should be valid!");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 6) {
      _password = LoginValidationItem(value, null);
    } else {
      _password =
          LoginValidationItem(null, "Password should be minimum 6 char!");
    }
    notifyListeners();
  }
}
