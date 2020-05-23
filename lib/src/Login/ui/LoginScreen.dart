import 'package:emart/src/LocalStorage/Preferences/SharedPref.dart';
import 'package:emart/src/Login/provider/LoginProvider.dart';
import 'package:emart/src/Utils/EmartColor.dart';
import 'package:emart/src/Utils/EmartNavigator.dart';
import 'package:emart/src/Utils/EmartString.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen>{
  TextEditingController emailIdController;
  String emailIdPref;

  @override
  void initState() {
    emailIdController = TextEditingController();
    emailIdController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    emailIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getFromPref();
    return ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
          child: Scaffold(
            body: Container(
              color: EmartColor.bgColor,
              child: Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                30.0, 20.0, 30.0, 20.0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30),
                                Align(
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/emart_appicon.png',
                                    ),
                                    height: 100.0,
                                    width: 100.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: TextField(

                                    controller: emailIdController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: EmartString.emailPhone,
                                      errorText: provider.emailId.error,

                                    ),
                                    onChanged: (String value) {
                                      provider.validateEmailId(value);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: EmartString.password,
                                      errorText: provider.password.error,
                                    ),
                                    onChanged: (String value) {
                                      provider.validatePassword(value);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      EmartString.forgotPassword,
                                      style: TextStyle(
                                        color: EmartColor.appTheamColor,
                                        fontSize: 15,
                                        fontFamily: 'AllerRegular',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),

                                Container(
                                  height: 40,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    onPressed: () => (!provider.isValid)
                                        ? null
                                        : provider.submitData(context),
                                    color: EmartColor.appTheamColor,
                                    splashColor: Colors.purple,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        EmartString.login,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'AllerRegular',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    EmartString.dontHaveAccountYet,
                                    style: TextStyle(
                                      //color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                //InkWell(
                                Container(
                                  height: 40,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    onPressed: () =>
                                        EmartNavigator.goToRegistration(
                                            context),
                                    color: EmartColor.appTheamColor,
                                    splashColor: Colors.purple,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        EmartString.signUp,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'AllerRegular',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        /*);
      },*/
    );
  }
    getFromPref() async {
  final  _preferences = await SharedPreferences.getInstance();
    setState(() {
      emailIdPref =  _preferences.getString(SharedPref.emailId);
      emailIdController.value = TextEditingValue(
        text: emailIdPref,
        selection: TextSelection(baseOffset: emailIdPref.length, extentOffset: emailIdPref.length),
        composing: TextRange.empty,

      );
     // emailIdController = TextEditingController(text: emailIdPref);
    });
  }
}
