import 'dart:convert';
import 'package:emart/src/Constants/EmartApi.dart';
import 'package:http/http.dart' as http;
import 'package:emart/src/Constants/EmartError.dart';
import 'package:emart/src/LocalStorage/Preferences/SharedPref.dart';
import 'package:emart/src/NetworkCall/FutureCallToServer.dart';
import 'package:emart/src/UserRegistration/data/model/RegistrationResponseModel.dart';
import 'package:emart/src/Utils/AlertDialogWidgets.dart';
import 'package:emart/src/Utils/ValidationItem.dart';
import 'package:flutter/material.dart';
import 'package:emart/src/Utils/Validation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class RegistrationProvider extends ChangeNotifier {
  RegistrationResponseModel user;
  String errorMessage;
  bool loading = false;

  bool emailValidationStatus;
  bool passwordValidationStatus;
  bool confirmPasswordValidationStatus;
  bool mobileNumberValidationStatus;

  ValidationItem _emailId = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _confirmPassword = ValidationItem(null, null);
  ValidationItem _mobileNumber = ValidationItem(null, null);

  // Getter
  ValidationItem get emailId => _emailId;

  ValidationItem get password => _password;

  ValidationItem get confirmPassword => _confirmPassword;

  ValidationItem get mobileNumber => _mobileNumber;

/*
  getUserData(String body) async {
    //FutureCallToServer futureCallToServer = FutureCallToServer();
     // FOR list pass this -
    // return FutureCallToServer.getRequest<List<RegistrationResponseModel>,RegistrationResponseModel>(body);
    return FutureCallToServer.getRequest<RegistrationResponseModel,Null>(body);
  }*/
  Future<bool> getUserData() async {
    Map data = {
      "email": _emailId.value,
      "mobileNumber": _mobileNumber.value,
      "password": _password.value,
      "confirmPassword": _confirmPassword.value
    };
    //encode Map to JSON
    var body = json.encode(data);
    setLoading(true);
    try {
      var result = await FutureCallToServer.requestToServer<
          RegistrationResponseModel, Null>(body, EmartApi.registration);
      setLoading(false);
      setUser(result);
      print("RESULT=" + result.email);
    } catch (e) {
      setLoading(false);
    }

    return isUser();
  }

  bool get isValid {
    if (_emailId.value != null &&
        _password.value != null &&
        _confirmPassword.value != null &&
        _mobileNumber.value != null) {
      if (emailValidationStatus &&
          passwordValidationStatus &&
          confirmPasswordValidationStatus &&
          mobileNumberValidationStatus)
        return true;
      else {
        notifyListeners();
        return false;
      }
    } else {
      if (_emailId.value == null)
        _emailId =
            ValidationItem(null, EmartError.uiError["fieldsSholdNotBeEmpty"]);
      if (_mobileNumber.value == null)
        _mobileNumber =
            ValidationItem(null, EmartError.uiError["fieldsSholdNotBeEmpty"]);
      if (_password.value == null)
        _password =
            ValidationItem(null, EmartError.uiError["fieldsSholdNotBeEmpty"]);
      if (_confirmPassword.value == null)
        _confirmPassword =
            ValidationItem(null, EmartError.uiError["fieldsSholdNotBeEmpty"]);
      notifyListeners();
      return false;
    }
  }

  // Setter
  void validateEmailId(String value) {
    if (Validation.isEmailValid(value)) {
      emailValidationStatus = true;
      _emailId = ValidationItem(value, null);
    } else {
      emailValidationStatus = false;
      _emailId =
          ValidationItem(value, EmartError.uiError["emailValidationError"]);
    }
    notifyListeners();
  }

  void validatePassword(String value) {
    if (value.length >= 6) {
      passwordValidationStatus = true;
      _password = ValidationItem(value, null);
    } else {
      passwordValidationStatus = false;
      _password = ValidationItem(
          value, EmartError.uiError["passLengthValidationError"]);
    }
    notifyListeners();
  }

  void validateConfirmPassword(String value) {
    if (value.length >= 6) {
      if (_password.value == value) {
        confirmPasswordValidationStatus = true;
        _confirmPassword = ValidationItem(value, null);
      } else {
        confirmPasswordValidationStatus = false;
        _confirmPassword =
            ValidationItem(value, EmartError.uiError["passwordNotMatch"]);
      }
    } else {
      confirmPasswordValidationStatus = false;
      _confirmPassword = ValidationItem(
          value, EmartError.uiError["passLengthValidationError"]);
    }
    notifyListeners();
  }

  void validateMobibleNumber(String value) {
    if (Validation.isMobileNumberValid(value)) {
      mobileNumberValidationStatus = true;
      _mobileNumber = ValidationItem(value, null);
    } else {
      mobileNumberValidationStatus = false;
      _mobileNumber = ValidationItem(
          value, EmartError.uiError["mobileNumberValidationError"]);
    }
    notifyListeners();
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

  RegistrationResponseModel getUSer() {
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
