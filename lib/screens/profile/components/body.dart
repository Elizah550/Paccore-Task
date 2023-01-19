import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:doctor_consultation_app/screens/ProfilePage.dart';
import 'package:doctor_consultation_app/screens/page/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:doctor_consultation_app/screens/Dashboard/Dash.dart';
import 'package:doctor_consultation_app/screens/Dashboard/Dashboard.dart';
import 'package:doctor_consultation_app/widgets/User_Provider.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ProfilePic(),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                // color: primary,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(image: AssetImage('assets/Logo_Updated.gif'))),
          ),
          // SizedBox(height: 5),
          ProfileMenu(
            text: "My Profile",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfilePage1()),
              );
            },
          ),
          ProfileMenu(
            text: "Diseases Interests",
            icon: "assets/icons/ChatbubbleIcon.svg",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CheckBox()),
              );
            },
          ),
          ProfileMenu(
            text: "Patient Records",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Dash()),
              );
            },
          ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/User Icon.svg",
          //   press: ()  {},
          // ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              user.signOut();
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
        ],
      ),
    );
  }
}
