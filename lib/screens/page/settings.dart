import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.lightBlueAccent,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
            // Divider(
            //   height: 15,
            //   thickness: 2,
            // ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "R & D"),
            buildAccountOptionRow(context, "Trials"),
            buildAccountOptionRow(context, "Doctors Information"),
            buildAccountOptionRow(context, "Misc"),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.lightBlue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("More Information", true),
            buildNotificationOptionRow("Opportunity", true),
            SizedBox(
              height: 50,
            ),
            Center(
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                color: Colors.lightBlue[100],
                onPressed: () {
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
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2.2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat')),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              activeColor: Colors.lightBlueAccent,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat')),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlatButton(
                        onPressed: () {},
                        child: Text("Option 1",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'))),
                    FlatButton(
                        onPressed: () {},
                        child: Text("Option 2",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'))),
                    FlatButton(
                        onPressed: () {},
                        child: Text("Option 3",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'))),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'))),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue[200],
            ),
          ],
        ),
      ),
    );
  }
}
