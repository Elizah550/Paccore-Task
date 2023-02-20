import 'package:flutter/material.dart';
import 'package:medicare/routes/router.dart';
import 'package:medicare/screens/signin_screen.dart';
import 'package:medicare/tabs/welcome.dart';
import 'package:medicare/utils/textscale.dart';
import 'package:medicare/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: fixTextScale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
        // textTheme: TextTheme(
        //   display1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //   button: TextStyle(color: kPrimaryColor),
        //   headline:
        //   TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        // ),//<-- SEE HERE
      ),
      // initialRoute: '/',
      // routes: routes,
      home: WelcomeScreen(),
    );
  }
}
