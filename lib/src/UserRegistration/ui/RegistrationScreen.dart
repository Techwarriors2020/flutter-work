import 'package:emart/src/Login/provider/validation/LoginValidation.dart';
import 'package:emart/src/UserRegistration/provider/validation/RegstrationValidation.dart';
import 'package:emart/src/Utils/EmartColor.dart';
import 'package:emart/src/Utils/EmartString.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final validationService = Provider.of<LoginValidation>(context);
    return ChangeNotifierProvider<RegistrationValidation>(
      create: (context) => RegistrationValidation(),
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(EmartString.userRegistration),
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context, false),
            )
        ),
        body: Container(
          color: EmartColor.bgColor,
          child: Consumer<RegistrationValidation>(
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
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: TextField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Email',
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
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Phone',
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
                              height: 20,
                            ),
                            Container(
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Confirm password',
                                  errorText: provider.password.error,
                                ),
                                onChanged: (String value) {
                                  provider.changePassword(value);
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
                                    : provider.submitData(context),
                                color: EmartColor.appTheamColor,
                                splashColor: Colors.purple,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
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
