import 'package:emart/src/LocalStorage/Preferences/SharedPref.dart';
import 'package:emart/src/Login/provider/LoginProvider.dart';
import 'package:emart/src/UserRegistration/data/model/RegistrationResponseModel.dart';
import 'package:emart/src/UserRegistration/provider/RegstrationProvider.dart';
import 'package:emart/src/Utils/AlertDialogWidgets.dart';
import 'package:emart/src/Utils/EmartColor.dart';
import 'package:emart/src/Utils/EmartNavigator.dart';
import 'package:emart/src/Utils/EmartString.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  RegistrationProvider provide;
  void submitData(BuildContext context)  {
    provide.getUserData().then((value) {
      if (value) {
        RegistrationResponseModel registrationResponseModel =
            provide.getUSer();
        SharedPref.savePrefStr(
            SharedPref.emailId, registrationResponseModel.email);
        String message = registrationResponseModel.message;
        AlertDialogWidgets.showAlertWithTwoButtons(context, "REG", message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //final validationService = Provider.of<LoginValidation>(context);
    return ChangeNotifierProvider<RegistrationProvider>(
      create: (context) => RegistrationProvider(),
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(EmartString.userRegistration),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: Container(
          color: EmartColor.bgColor,
          child: Consumer<RegistrationProvider>(
            builder: (context, provider, child) {
              provide = provider;
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
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: TextField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: EmartString.email,
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
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: EmartString.phone,
                                  errorText: provider.mobileNumber.error,
                                ),
                                onChanged: (String value) {
                                  provider.validateMobibleNumber(value);
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
                              height: 20,
                            ),
                            Container(
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: EmartString.confirmPassword,
                                  errorText: provider.confirmPassword.error,
                                ),
                                onChanged: (String value) {
                                  provider.validateConfirmPassword(value);
                                },
                              ),
                            ),

                            SizedBox(
                              height: 40,
                            ),
                            //InkWell(
                            Container(
                              height: 40,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                onPressed: () => (!provider.isValid)
                                    ? null
                                    : submitData(context),
                                color: EmartColor.appTheamColor,
                                splashColor: Colors.purple,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: provider.isLoading()
                                      ? CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                          strokeWidth: 2,
                                        )
                                      : Text(
                                          EmartString.signUpSmall,
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
