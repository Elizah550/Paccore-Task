import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';
import 'package:doctor_consultation_app/screens/Login/Login_Screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:doctor_consultation_app/screens/Splash/Splash_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _storage = FlutterSecureStorage();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  final all = await _storage.readAll();
  var status = false;
  print(all["status"]);
  print(all["Phone"]);
  print(all["Zipcode"]);
  if (all["status"] == "Authenticated") {
    status = true;
    print(status);
  } else {
    status = false;
    print(status);
  }
  runApp(MyApp(
    page_status: status,
  ));
}

class MyApp extends StatelessWidget {
  final page_status;
  MyApp({
    this.page_status,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.varelaRoundTextTheme(
                    Theme.of(context).textTheme),
              ),
              home: page_status == true ? CheckBox() : SplashScreen(),
            );
          },
        );
      },
    );
  }
}

// theme: ThemeData(
// textTheme: GoogleFonts.varelaRoundTextTheme(
// Theme.of(context).textTheme),
// ),
