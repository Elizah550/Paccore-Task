import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_consultation_app/home.dart';
import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';

class GridDashboard extends StatelessWidget {

  Items item1 = new Items(
      title: "Doctors",
      // subtitle: Diseases[0] + ', \n',
      event: "3 Events",
      img: "assets/doctor_icon_1.png"
  );

  Items item2 = new Items(
    title: "Literature",
    // subtitle: Diseases[0],
    event: "4 Items",
    img: "assets/food.png",
  );
  Items item3 = new Items(
    title: "Clinical Trials",
    // subtitle: Diseases[0] + ', \n',
    // event: "4 Items",
    img: "assets/map.png",
  );
  Items item4 = new Items(
    title: "Misc",
    // subtitle: Diseases[0] + ', \n',
    // event: "4 Items",
    img: "assets/festival.png",
    // onTap:{
    //
    // }
  );

  // Items item5 = new Items(
  //   title: "To do",
  //   subtitle: "Homework, Design",
  //   event: "4 Items",
  //   img: "assets/food.png",
  // );
  // Items item6 = new Items(
  //   title: "Settings",
  //   subtitle: "",
  //   event: "2 Items",
  //   img: "assets/food.png",
  // );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4,];
    var color = Colors.blue[400];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: () {
                // print(Diseases[1]);
                if(list!= null)
                {
                  print(list.length);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage(list);
                      },
                    ),
                  );
                }
                else
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Oops !! Select Speciallity'),
                          actions: <Widget>[
                            FlatButton(
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
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[400], borderRadius: BorderRadius.circular(10),
                  boxShadow: [ BoxShadow(color: Colors.grey, offset: Offset(0.0, 10.0), //(x,y)
                  blurRadius: 6.0,),],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 55,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Text(
                    //   data.subtitle,
                    //   style: GoogleFonts.openSans(
                    //       textStyle: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w600)),
                    // ),
                    SizedBox(
                      height: 14,
                    ),
                    // Text(
                    //   data.event,
                    //   style: GoogleFonts.openSans(
                    //       textStyle: TextStyle(
                    //           color: Colors.white70,
                    //           fontSize: 11,
                    //           fontWeight: FontWeight.w600)),
                    // ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  // String subtitle;
  String event;
  String img;
  Items({this.title,this.event, this.img,});
}
