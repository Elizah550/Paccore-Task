import 'dart:convert';

import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:doctor_consultation_app/widgets/User_Provider.dart';

TextEditingController _FullName = TextEditingController();
TextEditingController _Gender = TextEditingController();
TextEditingController _Age = TextEditingController();
TextEditingController _Research = TextEditingController();
TextEditingController _Address = TextEditingController();
TextEditingController _Zipcode = TextEditingController();
TextEditingController _Phone = TextEditingController();

class ProfilePage1 extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage1>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              // new Container(
              //   height: 250.0,
              //   color: Colors.white,
              //   child: new Column(
              //     children: <Widget>[
              //       // Padding(
              //       //     padding: EdgeInsets.only(left: 20.0, top: 20.0),
              //       //     child: new Row(
              //       //       crossAxisAlignment: CrossAxisAlignment.start,
              //       //       children: <Widget>[
              //       //         new Icon(
              //       //           Icons.arrow_back_ios,
              //       //           color: Colors.black,
              //       //           size: 22.0,
              //       //         ),
              //       //         // Padding(
              //       //         //   padding: EdgeInsets.only(left: 25.0),
              //       //         //   child: new Text('PROFILE',
              //       //         //       style: TextStyle(
              //       //         //           fontWeight: FontWeight.bold,
              //       //         //           fontSize: 20.0,
              //       //         //           fontFamily: 'sans-serif-light',
              //       //         //           color: Colors.black)),
              //       //         // )
              //       //       ],
              //       //     )),
              //       // Padding(
              //       //   padding: EdgeInsets.only(top: 20.0),
              //       //   child: new Stack(fit: StackFit.loose, children: <Widget>[
              //       //     new Row(
              //       //       crossAxisAlignment: CrossAxisAlignment.center,
              //       //       mainAxisAlignment: MainAxisAlignment.center,
              //       //       children: <Widget>[
              //       //         // new Container(
              //       //         //     width: 140.0,
              //       //         //     height: 140.0,
              //       //         //     decoration: new BoxDecoration(
              //       //         //       shape: BoxShape.circle,
              //       //         //       image: new DecorationImage(
              //       //         //         image: new ExactAssetImage(
              //       //         //             'assets/images/as.png'),
              //       //         //         fit: BoxFit.cover,
              //       //         //       ),
              //       //         //     )),
              //       //       ],
              //       //     ),
              //       //     // Padding(
              //       //     //     padding: EdgeInsets.only(top: 90.0, right: 100.0),
              //       //     //     child: new Row(
              //       //     //       mainAxisAlignment: MainAxisAlignment.center,
              //       //     //       children: <Widget>[
              //       //     //         new CircleAvatar(
              //       //     //           backgroundColor: Colors.red,
              //       //     //           radius: 25.0,
              //       //     //           child: new Icon(
              //       //     //             Icons.camera_alt,
              //       //     //             color: Colors.white,
              //       //     //           ),
              //       //     //         )
              //       //     //       ],
              //       //     //     )),
              //       //   ]),
              //       // )
              //     ],
              //   ),
              // ),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 1.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Account Information',
                                    style: TextStyle(
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              // SizedWidth(5.0),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(height: 5.0),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  decoration: InputDecoration(
                                      hintText: newfullname.toString()),
                                  controller: _FullName,
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Age',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Gender',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      SizedBox(height: 5.0),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 133.0),
                                  child: new TextField(
                                    decoration: InputDecoration(
                                        hintText: newAge.toString()),
                                    controller: _Age,
                                    enabled: !_status,
                                  ),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: new TextField(
                                  decoration: InputDecoration(
                                      hintText: newgender.toString()),
                                  controller: _Gender,
                                  enabled: !_status,
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      // Padding(
                      //     padding: EdgeInsets.only(
                      //         left: 25.0, right: 25.0, top: 25.0),
                      //     child: new Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: <Widget>[
                      //         new Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: <Widget>[
                      //             new Text(
                      //               'Email ID',
                      //               style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     )),
                      // Padding(
                      //     padding: EdgeInsets.only(
                      //         left: 25.0, right: 25.0, top: 2.0),
                      //     child: new Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: <Widget>[
                      //         new Flexible(
                      //           child: new TextField(
                      //             decoration: InputDecoration(
                      //                 hintText: newResearch.toString()),
                      //             enabled: !_status,
                      //           ),
                      //         ),
                      //       ],
                      //     )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Zip Code',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Mobile',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 90.0),
                                  child: new TextField(
                                    decoration: InputDecoration(
                                        hintText: newzipcode.toString()),
                                    controller: _Zipcode,
                                    enabled: !_status,
                                  ),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: new TextField(
                                  decoration: InputDecoration(
                                      hintText: Phonenumber.toString()),
                                  controller: _Phone,
                                  enabled: !_status,
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Interests',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              // Expanded(
                              //   child: Container(
                              //     child: new Text(
                              //       'Address',
                              //       style: TextStyle(
                              //           fontSize: 20.0,
                              //           fontWeight: FontWeight.bold),
                              //     ),
                              //   ),
                              //   flex: 2,
                              // ),
                            ],
                          )),
                      SizedBox(height: 5.0),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 100.0),
                                  child: new TextField(
                                    decoration: InputDecoration(
                                        labelText: newResearch.toString()),
                                    controller: _Research,
                                    enabled: !_status,
                                  ),
                                ),
                                flex: 2,
                              ),
                              // Flexible(
                              //   child: new TextField(
                              //     decoration: InputDecoration(
                              //         hintText: newaddress.toString()),
                              //     controller: _Address,
                              //     enabled: !_status,
                              //   ),
                              //   flex: 2,
                              // ),
                            ],
                          )),
                      !_status ? _getActionButtons() : new Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 40.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                  if (await user.Update_user(
                        _Phone.text,
                        _FullName.text,
                        _Age.text,
                        _Zipcode.text,
                        _Gender.text,
                        _Research.text,
                      ) ==
                      true) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Edited Successfully",
                    )));
                  } else {
                    if (!await user.Update_user(
                      _Phone.text,
                      _FullName.text,
                      _Age.text,
                      _Zipcode.text,
                      _Gender.text,
                      _Research.text,
                    )) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Edit failed")));
                    }
                  }
                },
                // async {
                //   setState(() {
                //     _status = true;
                //     FocusScope.of(context).requestFocus(new FocusNode());
                //   });
                //
                //   // String url =
                //   //     'https://ejud1dfmy8.execute-api.ap-south-1.amazonaws.com/Update';
                //   // Map<String, String> headers1 = {
                //   //   "Content-type": "application/json"
                //   // };
                //   // print("Scisdydybajd222222222222222222222222");
                //   // print(newzipcode);
                //   // print(Diseases);
                //   // String json1 =
                //   //     '{"Disease":"$Diseases","Zipcode":"$newzipcode"}';
                //   // // make POST request
                //   // Response response1 =
                //   //     await post(url, headers: headers1, body: json1);
                //   // print("----------------------------------");
                //   // list = jsonDecode(response1.body);
                // },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.lightBlueAccent,
        radius: 22.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 27.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
