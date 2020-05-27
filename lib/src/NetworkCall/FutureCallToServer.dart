
import 'dart:convert';

import 'package:emart/src/Constants/EmartApi.dart';
import 'package:emart/src/Login/data/model/LoginResponseModel.dart';
import 'package:emart/src/UserRegistration/data/model/RegistrationResponseModel.dart';
import 'package:http/http.dart' as http;

class FutureCallToServer{
  static Future<T> requestToServer<T, K>(String body, String url) async {
    print("entered");
    final response = await http
        .post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      print("RES="+response.body.toString());
      return fromJson<T, K>(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');

    }
     }

    /// If T is a List, K is the subtype of the list.
    // ignore: missing_return
    static T fromJson<T, K>(dynamic json) {
      if (json is Iterable) {
        return _fromJsonList<K>(json) as T;
      } else if (T == RegistrationResponseModel) {
        return RegistrationResponseModel.fromJson(json) as T;
      }
      else if (T == LoginResponseModel) {
        return LoginResponseModel.fromJson(json) as T;
      }

     // print("MODEL DATA"+registrationResponseModel.email);
      /*else if (T == UserDetails) {
        return UserDetails.fromJson(json) as T;
      } else if (T == Message) {
        return Message.fromJson(json) as T;
      } else {
        throw Exception("Unknown class");
      }*/
    }

    static List<K> _fromJsonList<K>(List jsonList) {
      if (jsonList == null) {
        return null;
      }

      List<K> output = List();

      for (Map<String, dynamic> json in jsonList) {
        output.add(fromJson(json));
      }

      return output;
    }
}
