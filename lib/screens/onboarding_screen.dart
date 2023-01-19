import 'package:doctor_consultation_app/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/screens/Signup/Signup_Screen.dart';
import 'package:doctor_consultation_app/screens/Signup/Signup_Screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/onboarding_illustration.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Doctor  App',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: kTitleTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'We welcome patients and doctors \n to make the disease go away........',
                      style: TextStyle(
                        fontSize: 16,
                        color: kTitleTextColor.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ),
                        );
                      },
                      color: kOrangeColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Patients Start Here',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
