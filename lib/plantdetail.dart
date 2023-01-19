import 'package:doctor_consultation_app/screens/Login/Login_screen.dart';
import 'package:flutter/material.dart';

class PlantDetail extends StatelessWidget {
  final String Names;
  final String Speciallity;
  final String speciality2;
  final String Address;
  PlantDetail(this.Names, this.Speciallity, this.speciality2, this.Address);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.blue[400]),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, left: MediaQuery.of(context).size.width - 60.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyHomePage_A();
                        },
                      ),
                    );
                  },
                  backgroundColor: Colors.blue[400],
                  mini: true,
                  elevation: 0.0,
                  child: Icon(Icons.logout, color: Colors.white, size: 30.0),
                ),
              ),
              // Positioned(
              //   top: 10.0,
              //   left: MediaQuery.of(context).size.width - 30.0,
              //   child: Container(
              //     height: 18.0,
              //     width: 18.0,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(9.0),
              //         color: Colors.white),
              //     child: Center(
              //       child: Text(
              //         '1',
              //         style: TextStyle(
              //             color: Color(0xFF399D63), fontFamily: 'Montserrat'),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Doctor',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[900]),
                    ),
                    Text(
                      Names,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Speciallity',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[900]),
                    ),
                    Text(
                      Speciallity,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Other Specialization',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[900]),
                    ),
                    Text(
                      speciality2,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10.0),
                    // Container(
                    //   height: 30.0,
                    //   width: 130.0,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //       color: Colors.black),
                    //   child: Center(
                    //     child: Text("Cure Science",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 20,
                    //             fontFamily: 'Montserrat')),
                    //   ),
                    // )
                  ],
                ),
              ),
              // Positioned(
              //   top: (MediaQuery.of(context).size.height / 2) - 120.0,
              //   left: (MediaQuery.of(context).size.width / 2) - 1.0,
              //   child: Image(
              //     image: NetworkImage(
              //         'https://cdn.onlinewebfonts.com/svg/img_206976.png'),
              //     // fit: BoxFit.cover,
              //     height: 100.0,
              //     width: 150.0,
              //   ),
              // ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 275.0,
                      left: 20.0,
                      right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Description',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'If you are completely new to this doctor then ' +
                            Names +
                            ' is a brilliant first doctor to have more than 10+ years of experience.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Address',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        Address,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      // Text(
                      //   'Timings: 10:00AM - 19:00 PM',
                      //   style: TextStyle(
                      //     fontFamily: 'Montserrat',
                      //     fontSize: 14.0,
                      //   ),
                      // ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
