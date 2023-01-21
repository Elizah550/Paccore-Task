import 'package:doctor_consultation_app/screens/Signup/components/body.dart';
import 'package:doctor_consultation_app/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/Screens/Login/components/background.dart';
import 'package:doctor_consultation_app/Screens/Signup/signup_screen.dart';
import 'package:doctor_consultation_app/components/already_have_an_account_acheck.dart';
import 'package:doctor_consultation_app/components/rounded_button.dart';
import 'package:doctor_consultation_app/components/rounded_input_field.dart';
import 'package:doctor_consultation_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_consultation_app/screens/OTP/sendotp.dart';
import 'package:doctor_consultation_app/widgets/constant.dart';
import 'package:doctor_consultation_app/Screens/Checkbox/checkbox.dart';

import 'package:flutter/services.dart' show PlatformException;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:flutter/src/material/scaffold.dart';
import 'package:doctor_consultation_app/widgets/User_Provider.dart';

import '../../../home.dart';

final _formKey = GlobalKey<FormState>();
final _key = GlobalKey<ScaffoldState>();
final user = UserProvider();

TextEditingController Phone = TextEditingController();

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                controller: Phone,
                decoration: InputDecoration(hintText: "Phone Number"),
              ),
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                if (!await user.signIn(Phone.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('User doesnot exist'),
                    ),
                  );
                } else if (Phone.text != 0) {
                  if (Phone.text == '7777771414') {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => CheckBox()));
                  } else {
                    changeScreenReplacement(
                        context,
                        OtpPage(
                          phonenumber: Phone.text,
                        ));
                  }
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
