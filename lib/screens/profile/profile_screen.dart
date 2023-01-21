import 'package:flutter/material.dart';

import 'package:doctor_consultation_app/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  final String title = 'Settings';
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue[400],
          title: Text(title,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          centerTitle: true),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
