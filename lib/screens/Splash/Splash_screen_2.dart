import 'dart:async';
import 'dart:ui';
import 'package:doctor_consultation_app/screens/Dashboard/Dash.dart';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:flutter/material.dart';

class SplashScreen_2 extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen_2> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dash())));
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
          padding: EdgeInsets.only(top: 65.0),
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/rhenix_logo.png",
                  height: 200.0,
                  width: 500.0,
                ),
              ),
              Container(
                child: Text(
                  "Your Data is loading...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
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
