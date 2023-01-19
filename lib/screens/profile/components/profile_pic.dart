import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';
import 'package:doctor_consultation_app/screens/Signup/Signup_Screen.dart';
import 'package:flutter/material.dart';

import '../../ProfilePage.dart';
import '../../profile.dart';

class Profilepic extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Profilepic> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 35.0, 0.0, 0.0),
                    child: Text('Hello' + ' ' + newfullname,
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat')),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 130.0, 120.0, 0.0),
                    child: Text(
                      "Your Information",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  //   child: Text('jhi',
                  //       style: TextStyle(
                  //           fontSize: 80.0, fontWeight: FontWeight.bold)),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                  //   child: Text('.',
                  //       style: TextStyle(
                  //           fontSize: 80.0,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.green)),
                  // )
                ],
              ),
            ),
            Container(
                child: Column(
              children: <Widget>[
                SizedBox(height: 30.0),
                Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 180.0, 0.0),
                    child: Text(
                      "Name: " + ' ' + newfullname,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 230.0, 0.0),
                    child: Text(
                      "Age : " + ' ' + newAge,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 180.0, 0.0),
                    child: Text(
                      "Gender: " + ' ' + newgender,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 170.0, 0.0),
                    child: Text(
                      "Research: " + ' ' + newResearch,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 120.0, 0.0),
                    child: Text(
                      "Address : " + ' ' + newaddress,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 170.0, 0.0),
                    child: Text(
                      "Zipcode : " + ' ' + newzipcode,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                // TextField(
                //   decoration: InputDecoration(
                //       labelText: 'EMAIL',
                //       labelStyle: TextStyle(
                //           fontFamily: 'Montserrat',
                //           fontWeight: FontWeight.bold,
                //           color: Colors.grey),
                //       focusedBorder: UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.green))),
                // ),

                // TextField(
                //   decoration: InputDecoration(
                //       labelText: 'PASSWORD',
                //       labelStyle: TextStyle(
                //           fontFamily: 'Montserrat',
                //           fontWeight: FontWeight.bold,
                //           color: Colors.grey),
                //       focusedBorder: UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.green))),
                //   obscureText: true,
                // ),

                // Container(
                //   alignment: Alignment(1.0, 0.0),
                //   padding: EdgeInsets.only(top: 15.0, left: 20.0),
                //   child: InkWell(
                //       // child: Text(
                //       //   'Forgot Password',
                //       //   style: TextStyle(
                //       //       color: Colors.green,
                //       //       fontWeight: FontWeight.bold,
                //       //       fontFamily: 'Montserrat',
                //       //       decoration: TextDecoration.underline),
                //       // ),
                //       ),
                // ),
                SizedBox(height: 60.0),
                Container(
                  height: 50.0,
                  width: 330.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.blueAccent,
                    color: Colors.blue[400],
                    elevation: 7.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage1();
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 50.0,
                  width: 330.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.blueAccent,
                    color: Colors.blue[400],
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: 40.0,
                //   color: Colors.transparent,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Colors.black,
                //             style: BorderStyle.solid,
                //             width: 1.0),
                //         color: Colors.transparent,
                //         borderRadius: BorderRadius.circular(20.0)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Center(
                //           child:
                //               ImageIcon(AssetImage('assets/facebook.png')),
                //         ),
                //         SizedBox(width: 10.0),
                //         Center(
                //           child: Text('Log in with facebook',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: 'Montserrat')),
                //         )
                //       ],
                //     ),
                //   ),
                // )
              ],
            )),
          ],
        ));
  }
}
