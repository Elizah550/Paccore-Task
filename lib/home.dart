import 'package:doctor_consultation_app/plantdetail.dart';
import 'package:doctor_consultation_app/screens/Checkbox/checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/widgets/size_config.dart';
import 'package:doctor_consultation_app/widgets/constant.dart';
import 'package:doctor_consultation_app/widgets/size_config.dart';
import 'components/rounded_button.dart';

var list1;

class HomePage extends StatefulWidget {
  final list1;
  HomePage(this.list1);
  @override
  Homepagenew createState() => Homepagenew();
}

class Homepagenew extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    list1 = widget.list1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors Information"),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: list1.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
            title: Row(
              children: <Widget>[
                Container(
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.blue)),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PlantDetail(
                                list1[index]["doctor_name"].replaceAll(
                                  "Dr.",
                                  "",
                                ),
                                list1[index]["speciality1"],
                                list1[index]["speciality2"],
                                list1[index]["address"],
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Card(
                          elevation: 10,
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // image: DecorationImage(
                                  //     fit: BoxFit.cover,
                                  //     image: NetworkImage(
                                  //         'https://www.sheltonbulldogs.com/main/images/staff/avatar.jpg'))
                                ),
                              ),
                              // Text(
                              //   "Name:  ",
                              //   style: TextStyle(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.bold,
                              //       fontFamily: 'Montserrat'),
                              // ),
                              Text(
                                list1[index]["doctor_name"].toString(),
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
