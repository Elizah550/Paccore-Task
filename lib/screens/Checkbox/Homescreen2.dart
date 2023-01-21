// import 'package:doctor_consultation_app/constant.dart';
// import 'package:doctor_consultation_app/widgets/counter.dart';
// import 'package:doctor_consultation_app/widgets/my_header.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:doctor_consultation_app/home.dart';
//
// import 'checkbox.dart';
//
// String dropdownValue_5 = 'Neurology';
//
// class HomeScreen2 extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen2> {
//   final controller = ScrollController();
//   double offset = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller.addListener(onScroll);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller.dispose();
//     super.dispose();
//   }
//
//   void onScroll() {
//     setState(() {
//       offset = (controller.hasClients) ? controller.offset : 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         controller: controller,
//         child: Column(
//           children: <Widget>[
//             MyHeader(
//               image: "assets/icons/Drcorona.svg",
//               textTop: "We help",
//               textBottom: "Doctors Reach",
//               offset: offset,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               height: 60,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(25),
//                 border: Border.all(
//                   color: Color(0xFFE5E5E5),
//                 ),
//               ),
//               child: Row(
//                 children: <Widget>[
//                   SvgPicture.asset("assets/icons/maps-and-flags.svg"),
//                   SizedBox(width: 20),
//                   Expanded(
//                     child: DropdownButton(
//                       value: dropdownValue_5,
//                       isExpanded: true,
//                       underline: SizedBox(),
//                       icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//                       items: [
//                         'Neurology',
//                         'Internal Medicine',
//                         'Pain Medicine',
//                         'Sleep Medicine',
//                         'Vascular Neurology',
//                         'Pediatric Neurology',
//                       ].map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (String newValue) {
//                         setState(() {
//                           dropdownValue_5 = newValue;
//                           if (newValue == 'Neurology') {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return HomePage(list);
//                                 },
//                               ),
//                             );
//                           } else if (newValue == 'Internal Medicine') {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return HomePage();
//                                 },
//                               ),
//                             );
//                           } else if (newValue == 'Pain Medicine') {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return HomePage();
//                                 },
//                               ),
//                             );
//                           } else if (newValue == 'Sleep Medicine') {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return HomePage();
//                                 },
//                               ),
//                             );
//                           } else if (newValue == 'Vascular Neurology') {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return HomePage();
//                                 },
//                               ),
//                             );
//                           } else if (newValue == 'Pediatric Neurology') {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return HomePage();
//                                 },
//                               ),
//                             );
//                           }
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Newest update March 28",
//                               style: TextStyle(
//                                 color: kTextLightColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       Text(
//                         "See details",
//                         style: TextStyle(
//                           color: kPrimaryColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(0, 4),
//                           blurRadius: 30,
//                           color: kShadowColor,
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Counter(
//                           color: kInfectedColor,
//                           number: 1046,
//                           title: "Patients",
//                         ),
//                         Counter(
//                           color: kDeathColor,
//                           number: 89,
//                           title: "Cases",
//                         ),
//                         Counter(
//                           color: kRecovercolor,
//                           number: 300,
//                           title: "Recruiting",
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "Spread of Patients",
//                         style: kTitleTextstyle,
//                       ),
//                       Text(
//                         "See details",
//                         style: TextStyle(
//                           color: kPrimaryColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20),
//                     padding: EdgeInsets.all(20),
//                     height: 178,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(0, 10),
//                           blurRadius: 30,
//                           color: kShadowColor,
//                         ),
//                       ],
//                     ),
//                     child: Image.asset(
//                       "assets/images/map.png",
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
