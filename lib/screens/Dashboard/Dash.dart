import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:doctor_consultation_app/screens/ProfilePage.dart';
import 'package:doctor_consultation_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_consultation_app/screens/Dashboard/Dashboard.dart';

void main() => runApp(MaterialApp(home: Dash()));

class Dash extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[400],
        title: Text('DashBoard',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        centerTitle: true,
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme().apply(bodyColor: Colors.white),
            ),
            child: PopupMenuButton<int>(
              color: Colors.lightBlueAccent[400],
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      // Icon(Icons.settings),
                      const SizedBox(width: 8),
                      Text(
                        'Hi !'+ ' '+ ' There',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.account_circle),
                      const SizedBox(width: 8),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      const SizedBox(width: 8),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      const SizedBox(width: 8),
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // SizedBox(
          //   height: 30,
          // ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: IconButton(
          //     icon: Icon(Icons.arrow_back, color: Colors.black),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      // decoration: BoxDecoration(
                      //   border: Border(
                      //     top: BorderSide(
                      //       color: Colors.blue,
                      //       width: 3.0,      /*--> you can set a custom width too!*/
                      //     ),
                      //     bottom: BorderSide(
                      //       color: Colors.blue,
                      //     ),
                      //   ),
                      // ),
                      // child: _fade(),
                      child: Text(
                        "Hello, There",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    // Text(
                    //   "Dashboard",
                    //   style: GoogleFonts.openSans(
                    //       textStyle: TextStyle(
                    //           color: Color(0xffa29aac),
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w600)),
                    // ),
                  ],
                ),
                // IconButton(
                //   alignment: Alignment.topCenter,
                //   icon: Image.asset(
                //     "assets/calendar.png",
                //     width: 24,
                //   ),
                //   onPressed: () {},
                // )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Dash()),
        );
        break;
      case 2:
        user.signOut();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage_A()),
              (route) => false,
        );
    }
  }
}

// Widget _fade(){
//   return SizedBox(
//     width: 250.0,
//     child: DefaultTextStyle(
//       style: GoogleFonts.openSans(
//             textStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold)),
//       child: Center(
//         child: AnimatedTextKit(
//           repeatForever: true,
//           animatedTexts: [
//             FadeAnimatedText('Welcome, '+ ' ' + newfullname ,
//                 duration: Duration(seconds: 3),fadeOutBegin: 0.9,fadeInEnd: 0.7),
//           ],
//         ),
//       ),
//     ),
//   );
//
// }