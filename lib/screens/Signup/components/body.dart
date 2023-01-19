// import 'package:doctor_consultation_app/screens/Login/components/body.dart';
// import 'package:doctor_consultation_app/screens/Signup/components/dropdown.dart';
// import 'package:flutter/material.dart';
// import 'package:doctor_consultation_app/Screens/Login/login_screen.dart';
// import 'package:doctor_consultation_app/Screens/Signup/components/background.dart';
// import 'package:doctor_consultation_app/Screens/Signup/components/or_divider.dart';
// import 'package:doctor_consultation_app/Screens/Signup/components/social_icon.dart';
// import 'package:doctor_consultation_app/components/already_have_an_account_acheck.dart';
// import 'package:doctor_consultation_app/components/rounded_button.dart';
// import 'package:doctor_consultation_app/components/rounded_input_field.dart';
// import 'package:doctor_consultation_app/components/rounded_password_field.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:doctor_consultation_app/components/text_field_container.dart';
// import 'package:doctor_consultation_app/widgets/constant.dart';
// import 'package:doctor_consultation_app/widgets/User_Provider.dart';
//
// import 'package:doctor_consultation_app/screens/OTP/sendotp.dart';
//
//
// String country = "+91";
// String Gender = "Male";
// String Research = "R&D";
//
// final user = UserProvider();
//
// TextEditingController FullName = TextEditingController();
// TextEditingController Age = TextEditingController();
// TextEditingController PatientAddress = TextEditingController();
// TextEditingController Zipcode = TextEditingController();
// TextEditingController Phone = TextEditingController();
//
// class Body extends StatefulWidget {
//   @override
//   body createState() => body();
// }
//
// class body extends State<Body> {
//   String dropdownValue_1 = 'R&D';
//   String dropdownValue_2 = 'Female';
//   String dropdownValue_3 = 'India';
//
//   DateTime _date = DateTime.now();
//
//   Future<Null> selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//       context: context,
//       initialDate: _date,
//       firstDate: DateTime(1970),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != _date) {
//       setState(() {
//         _date = picked;
//         print(_date.toString());
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "SIGNUP",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: size.height * 0.03),
//             SvgPicture.asset(
//               "assets/icons/signup.svg",
//               height: size.height * 0.35,
//             ),
//             RoundedInputField(
//               hintText: "Full Name",
//               onChanged: (value) {},
//               controller: FullName,
//             ),
//             RoundedInputField(
//               hintText: "Phone",
//               onChanged: (value) {},
//               controller: Phone,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10),
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               width: size.width * 0.8,
//               decoration: BoxDecoration(
//                 color: kPrimaryLightColor,
//                 borderRadius: BorderRadius.circular(29),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     "Yours Interests : ",
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                   ),
//                   DropdownButton<String>(
//                     value: dropdownValue_1,
//                     icon: Icon(Icons.arrow_drop_down),
//                     iconSize: 24,
//                     iconEnabledColor: Colors.black,
//                     elevation: 16,
//                     style: TextStyle(color: Colors.black),
//                     underline: Container(
//                       height: 2,
//                       color: kPrimaryLightColor,
//                     ),
//                     onChanged: (String newValue) {
//                       setState(() {
//                         dropdownValue_1 = newValue;
//                         if (newValue == 'R&D') {
//                           print("1");
//                           Research = "R&D";
//                         } else if (newValue == 'Trials') {
//                           print("2");
//                           Research = "Trials";
//                         } else if (newValue == 'Doctors') {
//                           print("3");
//                           Research = "Doctors";
//                         } else if (newValue == 'Misc') {
//                           print("4");
//                           Research = "Misc";
//                         }
//                       });
//                     },
//                     items: <String>['R&D', 'Trials', 'Doctors', 'Misc']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10),
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               width: size.width * 0.8,
//               decoration: BoxDecoration(
//                 color: kPrimaryLightColor,
//                 borderRadius: BorderRadius.circular(29),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     "Gender : ",
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                   ),
//                   DropdownButton<String>(
//                     value: dropdownValue_2,
//                     icon: Icon(Icons.arrow_drop_down),
//                     iconSize: 24,
//                     iconEnabledColor: Colors.black,
//                     elevation: 16,
//                     style: TextStyle(color: Colors.black),
//                     underline: Container(
//                       height: 2,
//                       color: kPrimaryLightColor,
//                     ),
//                     onChanged: (String newValue) {
//                       setState(() {
//                         dropdownValue_2 = newValue;
//                         if (newValue == 'Male') {
//                           print("1");
//                           Gender = "Male";
//                         } else if (newValue == 'Female') {
//                           print("2");
//                           Gender = "Female";
//                         } else if (newValue == 'Others') {
//                           print("3");
//                           Gender = "Others";
//                         }
//                       });
//                     },
//                     items: <String>['Male', 'Female', 'Others']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10),
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               width: size.width * 0.8,
//               decoration: BoxDecoration(
//                 color: kPrimaryLightColor,
//                 borderRadius: BorderRadius.circular(29),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     "Country Code : ",
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                   ),
//                   DropdownButton<String>(
//                     value: dropdownValue_3,
//                     icon: Icon(Icons.arrow_drop_down),
//                     iconSize: 24,
//                     iconEnabledColor: Colors.black,
//                     elevation: 16,
//                     style: TextStyle(color: Colors.black),
//                     underline: Container(
//                       height: 2,
//                       color: kPrimaryLightColor,
//                     ),
//                     onChanged: (String newValue) {
//                       setState(() {
//                         dropdownValue_3 = newValue;
//                         if (newValue == 'India') {
//                           print("1");
//                           country = "+91";
//                         } else if (newValue == 'US') {
//                           print("2");
//                           country = "+1";
//                         } else if (newValue == 'Germany') {
//                           print("3");
//                           country = "xyz";
//                         } else if (newValue == 'Russia') {
//                           print("4");
//                           country = "abc";
//                         }
//                       });
//                     },
//                     items: <String>['India', 'US', 'Germany', 'Russia']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//             RoundedInputField(
//               hintText: "Age",
//               onChanged: (value) {},
//               controller: Age,
//             ),
//             RoundedInputField(
//               hintText: "Zip code",
//               onChanged: (value) {},
//               controller: Zipcode,
//             ),
//             RoundedInputField(
//               hintText: "Patient Address",
//               onChanged: (value) {},
//               controller: PatientAddress,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10),
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               width: size.width * 0.8,
//               decoration: BoxDecoration(
//                 color: kPrimaryLightColor,
//                 borderRadius: BorderRadius.circular(29),
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.bed),
//                     onPressed: () {
//                       selectDate(context);
//                     },
//                   ),
//                   Text(
//                     "Date of Birth: ",
//                     style: TextStyle(color: kPrimaryColor, fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//             RoundedButton(
//                 text: "SIGNUP",
//                 press: () async {
//                   if (await user.signUp(
//                           FullName.text,
//                           Phone.text,
//                           Age.text,
//                           Zipcode.text,
//                           Research,
//                           country,
//                           Gender) ==
//                       true) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Signed up successfully")));
//                   } else {
//                     if (!await user.signUp(
//                         FullName.text,
//                         Phone.text,
//                         Age.text,
//                         Zipcode.text,
//                         Research,
//                         country,
//                         Gender)) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Sign up failed")));
//                     }
//                   }
//                 }),
//             SizedBox(height: size.height * 0.03),
//             AlreadyHaveAnAccountCheck(
//               login: false,
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return LoginScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//             OrDivider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SocalIcon(
//                     iconSrc: "assets/icons/facebook.svg",
//                     press: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return LoginScreen();
//                           },
//                         ),
//                       );
//                     }),
//                 SocalIcon(
//                   iconSrc: "assets/icons/twitter.svg",
//                   press: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return LoginScreen();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 SocalIcon(
//                   iconSrc: "assets/icons/google-plus.svg",
//                   press: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return LoginScreen();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
