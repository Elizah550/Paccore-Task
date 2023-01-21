import 'package:doctor_consultation_app/screens/Dashboard/Dash.dart';
import 'package:doctor_consultation_app/screens/Checkbox/components/notification_setting.dart';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:doctor_consultation_app/screens/Signup/components/body.dart';
import 'package:doctor_consultation_app/screens/Splash/Splash_screen_2.dart';
import 'package:doctor_consultation_app/screens/page/settings.dart';
import 'package:doctor_consultation_app/screens/profile/components/profile_pic.dart';
import 'package:doctor_consultation_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:doctor_consultation_app/home.dart';

import 'package:doctor_consultation_app/widgets/User_Provider.dart';
import 'package:doctor_consultation_app/screens/error/8_404_error_2.dart';


List<String> Diseases = [];

var count;
var list;
var data1;
var Phonenumber;
var newzipcode;
var newaddress;
var newAge;
var newResearch;
var newgender;
var newfullname;

class CheckBox extends StatelessWidget {
  final String title = 'Speciallity CheckBox';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        color: Colors.black,
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool isVisible = true;
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  final _storage = FlutterSecureStorage();
  final user = UserProvider();

  getuser() async {
    final current_user = await _storage.readAll();
    Phonenumber = current_user["Phone"];
    newzipcode = current_user["Zipcode"];
    newAge = current_user["Age"];
    newResearch = current_user["Research"];
    newgender = current_user["Gender"];
    newfullname = current_user["FullName"];
    print(Phonenumber);
    print(newzipcode);
    print(newAge);
    print(newResearch);
    print(newgender);
    print(newfullname);
  }

  @override
  void initState() {
    // user.signOut();
    super.initState();
    count = 0;
    getuser().then((id) {
      setState(() {});
    });
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: animationController,
    ));

    delayedAnimation = Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      parent: animationController,
    ));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
      parent: animationController,
    ));
  }

   final allowNotifications = NotificationSetting(title: 'Select Any three');

  final notifications = [
    NotificationSetting(title: 'Neurology'),
    NotificationSetting(title: 'Oncology'),
    NotificationSetting(title: 'Pain Medicine'),
    NotificationSetting(title: 'Pediatric Cancer'),
    NotificationSetting(title: 'Pediatric Neurology'),
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.blue[400],
              title: Text(widget.title,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
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
            body: Transform(
              transform: Matrix4.translationValues(
                  muchDelayedAnimation.value * width, 0.0, 0.0),
              child: ListView(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: MediaQuery.of(context).size.width - 60.0),
                  //   child: FloatingActionButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) {
                  //             return ProfilePage();
                  //           },
                  //         ),
                  //       );
                  //     },
                  //     backgroundColor: Colors.white,
                  //     child: Icon(Icons.menu,
                  //         color: Colors.lightBlueAccent, size: 30.0),
                  //   ),
                  // ),
                  Text('Select Your options',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          height: 3,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Divider(),
                  ...notifications.map(buildSingleCheckbox).toList(),
                  SizedBox(height: 40.0),
                  Container(
                    height: 50.0,
                    width: 200.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.blue[400],
                      elevation: 7.0,
                      child: MaterialButton(
                        onPressed: () async {
                          if (count == 0) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Select at least one option'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          else if (count > 3) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Select not more than three'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          // else if (count > 3) {
                          //   setState(() {
                          //     isVisible =!isVisible;
                          //   });
                          // }
                          else if (count == 1) {
                            String url =
                                'https://792ek2vs6l.execute-api.ap-south-1.amazonaws.com/StageDoctorApp';
                            Map<String, String> headers1 = {
                              "Content-type": "application/json"
                            };
                            print("Scisdydybajd222222222222222222222222");
                            print(newzipcode);
                            print(Diseases);
                            String json1 =
                                '{"Disease":"$Diseases","Zipcode":"$newzipcode"}';
                            // make POST request
                            Response response1 =
                                await post(url, headers: headers1, body: json1);
                            print("----------------------------------");
                            list = jsonDecode(response1.body);
                            print("Successful");
                            print(list);
                            print(list.length);
                            // print(list[0][1]);
                            if (list.length == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Error404Screen2();
                                  },
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SplashScreen_2();
                                  },
                                ),
                              );
                            }
                          } else if (count == 2) {
                            String url =
                                'https://792ek2vs6l.execute-api.ap-south-1.amazonaws.com/StageDoctorApp';
                            Map<String, String> headers1 = {
                              "Content-type": "application/json"
                            };
                            print("Scisdydybajd222222222222222222222222");
                            print(newzipcode);
                            print(Diseases);
                            String json1 =
                                '{"Disease":"$Diseases","Zipcode":"$newzipcode"}';
                            // make POST request
                            Response response1 =
                                await post(url, headers: headers1, body: json1);
                            print("----------------------------------");
                            list = jsonDecode(response1.body);
                            print("Successful");
                            print(list);
                            print(list.length);
                            // print(list[0][1]);
                            if (list.length == 0 ) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Error404Screen2();
                                  },
                                ),
                              );
                            }
                            else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SplashScreen_2();
                                  },
                                ),
                              );
                            }
                          } else if (count == 3) {
                            String url =
                                'https://792ek2vs6l.execute-api.ap-south-1.amazonaws.com/StageDoctorApp';
                            Map<String, String> headers1 = {
                              "Content-type": "application/json"
                            };
                            print("Scisdydybajd222222222222222222222222");
                            print(newzipcode);
                            print(Diseases);
                            String json1 =
                                '{"Disease":"$Diseases","Zipcode":"$newzipcode"}';
                            // make POST request
                            Response response1 =
                                await post(url, headers: headers1, body: json1);
                            print("----------------------------------");
                            list = jsonDecode(response1.body);
                            print("Successful");
                            print(list);
                            print(list.length);
                            // print(list[0][1]);
                            if (list.length == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Error404Screen2();
                                  },
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SplashScreen_2();
                                  },
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Divider(),
                  // Material(
                  //   borderRadius: BorderRadius.circular(5.0),
                  //   shadowColor: Colors.blueAccent,
                  //   color: Colors.blue[400],
                  //   elevation: 7.0,
                  //   child: Container(
                  //     child: MaterialButton(
                  //       onPressed: () {
                  //         user.signOut();
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) {
                  //               return MyHomePage_A();
                  //             },
                  //           ),
                  //         );
                  //       },
                  //       child: Text(
                  //         'Logout',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //           fontFamily: 'Montserrat',
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        });
  }

  Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
      notification: notification,
      onClicked: () {
        final newValue = !notification.value;
        setState(() {});
      });

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
        notification: notification,
        onClicked: () {
          setState(() {
            final newValue = !notification.value;
            notification.value = newValue;
            print('check from here');
            print(notification.value);
            print(notification.title);
            // if(count == 3 && notification.title == false)
            // {
            //   setState(() {
            //     isVisible:!isVisible;
            //   });
            // }
            // Diseases.clear();
            if (notification.value == true) {
              Diseases.insert(count, notification.title);
              count = count + 1;
              print(count);
            } else {
              Diseases.remove(notification.title);
              count = count - 1;
              print(count);
            }
          });
        },
      );

  Widget buildCheckbox({
    @required NotificationSetting notification,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: notification.value,
          onChanged: (value) => onClicked(),
        ),
        title: Visibility(
          visible:isVisible,
          child: Text(
            notification.title,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ),
      );

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
        // if(Diseases.length == null && count == null)
        //   {
        //     print('i m out');
        //     Navigator.of(context).push(
        //       MaterialPageRoute(builder: (context) => CheckBox()),
        //     );
        //   }
        // else if(Diseases.length != null && count != null)
        //   {
        //     print('i am in');
        //       Navigator.of(context).push(
        //         MaterialPageRoute(builder: (context) => Dash()),
        //       );
        //   }
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
