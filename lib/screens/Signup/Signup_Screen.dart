import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/widgets/constant.dart';

import 'package:doctor_consultation_app/widgets/User_Provider.dart';

String Research = "R&D";
String Gender = "Male";
String Country_Code = "+91";

final user = UserProvider();

TextEditingController FullName = TextEditingController();
TextEditingController Age = TextEditingController();
TextEditingController Address = TextEditingController();
TextEditingController Zipcode = TextEditingController();
TextEditingController Phone = TextEditingController();

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  String dropdownValue = 'R&D';
  String dropdownValue_1 = 'Female';
  String dropdownValue_2 = 'India';

  Animation animation, delayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: animationController,
    ));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      parent: animationController,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.0, 47.0, 0.0, 0.0),
                                child: Text(
                                  'Signup',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(160.0, 49.0, 0.0, 0.0),
                                child: Text(
                                  ' Patient',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent[400]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            delayedAnimation.value * width, 0.0, 0.0),
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 1.0, left: 20.0, right: 50.0),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                      labelText: 'FullName',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  controller: FullName,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Phone',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  controller: Phone,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Yours Interests : ",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                      DropdownButton<String>(
                                        value: dropdownValue,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 40,
                                        iconEnabledColor: Colors.grey,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue = newValue;
                                            if (newValue == 'R&D') {
                                              Research = "R&D";
                                            } else if (newValue == 'Trials') {
                                              Research = "Trials";
                                            } else if (newValue == 'Doctors') {
                                              Research = "Doctors";
                                            } else if (newValue == 'Misc') {
                                              Research = "Misc";
                                            }
                                          });
                                        },
                                        items: <String>[
                                          'R&D',
                                          'Trials',
                                          'Doctors',
                                          'Misc'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
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
                                  child: Row(
                                    children: [
                                      Text(
                                        "Gender : ",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      DropdownButton<String>(
                                        value: dropdownValue_1,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        iconEnabledColor: Colors.grey,
                                        elevation: 16,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue_1 = newValue;
                                            if (newValue == 'Male') {
                                              print("1");
                                              Gender = "Male";
                                            } else if (newValue == 'Female') {
                                              print("2");
                                              Gender = "Female";
                                            } else if (newValue == 'Others') {
                                              print("3");
                                              Gender = "Others";
                                            }
                                          });
                                        },
                                        items: <String>[
                                          'Male',
                                          'Female',
                                          'Others'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
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
                                  child: Row(
                                    children: [
                                      Text(
                                        "Country: ",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      DropdownButton<String>(
                                        value: dropdownValue_2,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        iconEnabledColor: Colors.grey,
                                        elevation: 16,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue_2 = newValue;
                                            if (newValue == 'India') {
                                              Country_Code = "+91";
                                            } else if (newValue == 'US') {
                                              Country_Code = "+1";
                                            } else if (newValue == 'Germany') {
                                              Country_Code = "xyz";
                                            } else if (newValue == 'Russia') {
                                              Country_Code = "abc";
                                            }
                                          });
                                        },
                                        items: <String>[
                                          'India',
                                          'US',
                                          'Germany',
                                          'Russia'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Age',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  controller: Age,
                                ),
                                // TextField(
                                //   decoration: InputDecoration(
                                //       labelText: 'Address',
                                //       labelStyle: TextStyle(
                                //           fontFamily: 'Montserrat',
                                //           fontWeight: FontWeight.bold,
                                //           color: Colors.grey),
                                //       focusedBorder: UnderlineInputBorder(
                                //           borderSide:
                                //               BorderSide(color: Colors.green))),
                                //   controller: Address,
                                // ),
                                TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Zipcode',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  controller: Zipcode,
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                    height: 45.0,
                                    width: 300.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shadowColor: Colors.blueAccent,
                                      color: Colors.blue[400],
                                      elevation: 7.0,
                                      child: MaterialButton(
                                        onPressed: () async {
                                          if (await user.signUp(
                                                Phone.text,
                                                FullName.text,
                                                Age.text,
                                                Zipcode.text,
                                                Gender,
                                                Country_Code,
                                                Research,
                                              ) ==
                                              true) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                              "Signed up successfully",
                                            )));
                                          } else {
                                            if (!await user.signUp(
                                              Phone.text,
                                              FullName.text,
                                              Age.text,
                                              Zipcode.text,
                                              Gender,
                                              Country_Code,
                                              Research,
                                            )) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Sign up failed")));
                                            }
                                          }
                                        },
                                        child: Text(
                                          'SIGNUP',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 10.0),
                                Container(
                                  height: 40.0,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                            width: 1.0),
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return MyHomePage_A();
                                            },
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Text('Go to Login',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ]),
              ));
        });
  }
}
