import 'package:emart/src/Constants/EmartRegex.dart';

class Validation {
  static bool isEmailValid(String emailId) {
    String regValue = EmartRegex.emailValidationRegex;
    RegExp regExp = new RegExp(regValue);
    return regExp.hasMatch(emailId);
  }

  static bool isPasswordValid() {
    return true;
  }

  static bool isPasswordMatch() {
    return true;
  }

  static bool isMobileNumberValid(String mobileNumber) {
    if (mobileNumber.length != 10)
      return false;
    else
      return true;
  }
}
