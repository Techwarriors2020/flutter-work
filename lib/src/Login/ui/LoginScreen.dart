import 'package:emart/src/Login/provider/validation/LoginValidation.dart';
import 'package:emart/src/Utils/EmartColor.dart';
import 'package:emart/src/Utils/EmartNavigator.dart';
import 'package:emart/src/Utils/EmartString.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final validationService = Provider.of<LoginValidation>(context);
    return ChangeNotifierProvider<LoginValidation>(
      create: (context) => LoginValidation(),
      child: Scaffold(
        body: Container(
          color: EmartColor.bgColor,
          child: Consumer<LoginValidation>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage(
                                  'assets/images/ic_launcher.png',
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
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Email or Phone',
                                  errorText: provider.userName.error,
                                ),
                                onChanged: (String value) {
                                  provider.changeUserName(value);
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
                                  labelText: 'Password',
                                  errorText: provider.password.error,
                                ),
                                onChanged: (String value) {
                                  provider.changePassword(value);
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
                                  onPressed: () => EmartNavigator.goToRegistration(context),
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
    );
  }
}
