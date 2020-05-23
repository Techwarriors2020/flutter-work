import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

static String emailId = 'emailId';
 static SharedPref _instance;
 static SharedPreferences _preferences;

 static Future<SharedPref> getInstanceSharePref() async {


   if (_instance == null) {
     _instance = SharedPref();
   }

   if (_preferences == null) {
     _preferences = await SharedPreferences.getInstance();
   }

   return _instance;
 }

  static savePrefStr(String key, String message) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setString(key, message);
  }

   getPrefStr(String key) async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getString(key);
  }


}
