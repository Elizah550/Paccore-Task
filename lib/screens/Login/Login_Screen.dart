import 'dart:convert';

import 'package:doctor_consultation_app/screens/profile/profile_screen.dart';
import 'package:doctor_consultation_app/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/screens/Signup/Signup_Screen.dart';
import 'package:http/http.dart';

import 'package:doctor_consultation_app/widgets/User_Provider.dart';
import 'package:doctor_consultation_app/screens/OTP/sendotp.dart';
import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';

final user = UserProvider();

TextEditingController Phone = TextEditingController();


class MyHomePage_A extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage_A>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
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

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
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
              resizeToAvoidBottomInset: false,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            // SizedBox(height: 40.0),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       top: 5.0,
                            //       left: MediaQuery.of(context).size.width -
                            //           200.0),
                            //   child: Container(
                            //     height: 200,
                            //     width: 700,
                            //     decoration: BoxDecoration(
                            //         // color: primary,
                            //         borderRadius: BorderRadius.circular(50.0),
                            //         image: DecorationImage(
                            //             image:
                            //                 AssetImage('assets/Logo_Updated.gif'))),
                            //   ),
                            // ),
                            // Container(
                            //   padding:
                            //       EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                            //   child: Text('Cure',
                            //       style: TextStyle(
                            //           fontSize: 80.0,
                            //           fontWeight: FontWeight.bold,
                            //           color: Colors.blue[800])),
                            //   // decoration: BoxDecoration(
                            //   //     image: DecorationImage(
                            //   //   image: AssetImage('assets/R_logo.gif'),
                            //   //   colorFilter: ColorFilter.mode(
                            //   //       Colors.greenAccent.withOpacity(1.0),
                            //   //       BlendMode.dstATop),
                            //   //   // fit: BoxFit.fitWidth,
                            //   //   alignment: Alignment.bottomRight,
                            //   // )),
                            // ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  delayedAnimation.value * width, 0.0, 0.0),
                              child: Container(
                                height: 370,
                                width: 370,
                                decoration: BoxDecoration(
                                  // color: primary,
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(image: AssetImage('assets/images/rhenix_logo.png'))),
                              ),
                            ),
                            // Container(
                            //   padding:
                            //       EdgeInsets.fromLTRB(210.0, 130.0, 0.0, 0.0),
                            //   child: Text(':)',
                            //       style: TextStyle(
                            //           fontSize: 50.0,
                            //           fontWeight: FontWeight.bold,
                            //           color: Colors.blue)),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayedAnimation.value * width, 0.0, 0.0),
                    child: Container(
                        padding:
                            EdgeInsets.only(top: 2.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Phone',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue[800]))),
                              controller: Phone,
                            ),
                            Container(
                              alignment: Alignment(1.0, 0.0),
                              padding: EdgeInsets.only(top: 15.0, left: 20.0),
                              child: InkWell(
                                child: Text(
                                  'Forgot Phone',
                                  style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    // decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              height: 50.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.blueAccent,
                                color: Colors.lightBlue,
                                elevation: 8.0,
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (!await user.signIn(Phone.text)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('User doesnot exist'),
                                        ),
                                      );
                                    } else if (Phone.text != 0) {
                                      if (Phone.text == '7777771414') {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CheckBox()));
                                      } else {
                                        changeScreenReplacement(
                                            context,
                                            OtpPage(
                                              phonenumber: Phone.text,
                                            ));
                                        // sendotpnew(phone);
                                      }
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0.0, 0.0),
                              child: Container(
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: ImageIcon(
                                            AssetImage('assets/facebook.png')),
                                      ),
                                      SizedBox(width: 10.0),
                                      Center(
                                        child: Text('Log in with facebook',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New to Here ?',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            // decoration: TextDecoration.underline
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ));
        });
  }
}
