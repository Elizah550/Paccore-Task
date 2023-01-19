import 'package:doctor_consultation_app/screens/Signup/components/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/Screens/Login/login_screen.dart';
import 'package:doctor_consultation_app/Screens/Signup/components/background.dart';
import 'package:doctor_consultation_app/Screens/Signup/components/or_divider.dart';
import 'package:doctor_consultation_app/Screens/Signup/components/social_icon.dart';
import 'package:doctor_consultation_app/components/already_have_an_account_acheck.dart';
import 'package:doctor_consultation_app/components/rounded_button.dart';
import 'package:doctor_consultation_app/components/rounded_input_field.dart';
import 'package:doctor_consultation_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_consultation_app/components/text_field_container.dart';
import 'package:doctor_consultation_app/widgets/constant.dart';

String country = "+91";

class Body extends StatefulWidget {
  @override
  body createState() => body();
}

class body extends State<Body> {
  String dropdownValue = 'India';
  DateTime _date = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Full Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Phone",
              onChanged: (value) {},
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Yours Interests : ",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    iconEnabledColor: Colors.black,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: kPrimaryLightColor,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        if (newValue == 'India') {
                          print("1");
                          country = "+91";
                        } else if (newValue == 'US') {
                          print("2");
                          country = "+1";
                        } else if (newValue == 'Germany') {
                          print("3");
                          country = "xyz";
                        } else if (newValue == 'Russia') {
                          print("4");
                          country = "abc";
                        }
                      });
                    },
                    items: <String>['India', 'US', 'Germany', 'Russia']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Gender : ",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    iconEnabledColor: Colors.black,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: kPrimaryLightColor,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        if (newValue == 'India') {
                          print("1");
                          country = "+91";
                        } else if (newValue == 'US') {
                          print("2");
                          country = "+1";
                        } else if (newValue == 'Germany') {
                          print("3");
                          country = "xyz";
                        } else if (newValue == 'Russia') {
                          print("4");
                          country = "abc";
                        }
                      });
                    },
                    items: <String>['India', 'US', 'Germany', 'Russia']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            RoundedInputField(
              hintText: "Martial Status",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Patient Address",
              onChanged: (value) {},
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.bed),
                    onPressed: () {
                      selectDate(context);
                    },
                  ),
                  Text(
                    "Date of Birth: ",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
            RoundedInputField(
              hintText: "Employability",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Query",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage_A();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
