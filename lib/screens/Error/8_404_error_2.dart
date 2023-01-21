import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:flutter/material.dart';

import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';

class Error404Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/7_Error.png",
            fit: BoxFit.cover,
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: IconButton(
          //     icon: Icon(Icons.arrow_back, color: Colors.white),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.42,
            left: MediaQuery.of(context).size.width * 0.040,
            child: Container(
              child:Text(" Your Zip Code didn't match this\n specialist \n\n\n\n\n\n\n\n  Try with Another Specialist !!!",
                style:TextStyle(color: Colors.grey[700],
                fontWeight:FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize:20,
              ),),
            ),
          ),
          // Positioned(
          //   bottom: MediaQuery.of(context).size.height * 0.17,
          //   left: MediaQuery.of(context).size.width * 0.040,
          //   child: Container(
          //     child:Text("Or Change Your Zipcode \n try Again",
          //       style:TextStyle(color: Colors.grey[700],
          //         fontWeight:FontWeight.bold,
          //         fontFamily: 'Montserrat',
          //         fontSize:20,
          //       ),),
          //   ),
          // ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.10,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 25,
                    color: Colors.black.withOpacity(0.17),
                  ),
                ],
              ),
              child: TextButton(
                // color: Colors.white,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(50)),
                // onPressed: () {
                //   // Navigator.push(
                //   //   context,
                //   //   MaterialPageRoute(
                //   //     builder: (context) {
                //   //       return MyHomePage_A();
                //   //     },
                //   //   ),
                //   // );
                // },
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(label: Text("Lets Go",
                    style: TextStyle(color: Colors.grey[700],fontFamily: 'Montserrat',fontSize:15,
                    ),
                  ),
                    style: TextButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),),),
                    icon: Icon(Icons.arrow_back, color: Colors.blue),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },),
                ),
                // child: IconButton(
                //   icon: Icon(Icons.arrow_back, color: Colors.green),
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
