import 'package:emart/src/Login/data/model/User.dart';

class LoginResponseModel {
  String code;
  String message;
  User user;

  LoginResponseModel({this.code, this.message, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}