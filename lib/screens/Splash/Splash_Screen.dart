import 'dart:async';
import 'dart:ui';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage_A())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFDFDFD),
                Color(0xFFFEFFFF),
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 35.0),
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/CureScience_Logo_1.png",
                  height: 400.0,
                  width: 500.0,
                ),
              ),
              // Container(
              //   child: Text(
              //     "--------------Doctor App--------------\n at your fingertips",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontFamily: 'Montserrat',
              //       color: Colors.grey[400],
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20.0,
              //     ),
              //   ),
              // ),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
