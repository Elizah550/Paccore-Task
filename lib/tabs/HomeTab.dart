import 'package:flutter/material.dart';
import 'package:medicare/styles/colors.dart';
import 'package:medicare/styles/styles.dart';

List<Map> doctors = [
  {
    'img': 'assets/person.jpeg',
    'doctorName': 'Robot Padberg',
    'doctorTitle': 'CMO || Borer'
  },
  {
    'img': 'assets/person.jpeg',
    'doctorName': 'Marat Padberg',
    'doctorTitle': 'COO || Boehm'
  },
  {
    'img': 'assets/person.jpeg',
    'doctorName': 'Alexa Padberg',
    'doctorTitle': 'CMO || Borer'
  },
  {
    'img': 'assets/person.jpeg',
    'doctorName': 'Shihu Padberg',
    'doctorTitle': 'COO || Boehm'
  }
];

class HomeTab extends StatelessWidget {
  final void Function() onPressedScheduleCard;
 

  const HomeTab({
    Key? key,
    required this.onPressedScheduleCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            UserIntro(),
            SizedBox(
              height: 10,
            ),
           // SearchInput(),
            // CategoryIcons(),
            SizedBox(
              height: 20,
            ),
            AppointmentCard(
              onTap: onPressedScheduleCard,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'DATA ACTIONS',
              style: TextStyle(
                color: Color(MyColors.header01),
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CategoryIcons(),
            Text(
              'EMAIL OPEN RATE',
              style: TextStyle(
                color: Color(MyColors.header01),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            for (var doctor in doctors)
              TopDoctorCard(
                img: doctor['img'],
                doctorName: doctor['doctorName'],
                doctorTitle: doctor['doctorTitle'],
              )
          ],
        ),
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Row(
          children: [
            Container(
              color: Colors.green,
              child: Image(
                width: 100,
                image: AssetImage(img),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      doctorName,
                      style: TextStyle(
                        color: Color(MyColors.header01),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      '63.4%',
                      style: TextStyle(
                        color: Color(MyColors.header01),
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: TextStyle(
                    color: Color(MyColors.grey02),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Material(
            borderRadius:BorderRadius.circular(15) ,
            color: Colors.grey,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,200,0),
                      child: Container(
                        width: 70,
                        height: 20,
                        // margin: EdgeInsets.all(10),
                        padding: EdgeInsets.fromLTRB(14,5,6,3),
                        child: Text('LECTURE',
                            style: TextStyle(color: Colors.white,fontSize: 10)),
                        decoration: BoxDecoration(
                            color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                           ),
                      ),
                    ),
                    Row(
                      children: [

                        SizedBox(
                          width: 10,
                          height: 120,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Text('LECTURE',
                                //     style: TextStyle(color: Colors.white)),
                                Text('B2B SALES\nTECHNIQUES',
                                    style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 40,
                                  // height: 2,
                                ),
                               Image.asset(
                                 'assets/person.jpeg',
                                 width: 100,
                                 height: 150,
                                   fit: BoxFit.cover,
                                ),
                                // Image.network('assets/person.jpeg', fit: BoxFit.fitWidth),
                              ],
                            ),
                            // SizedBox(
                            //   height: 20,
                            //   // height: 2,
                            // ),
                            Text(
                                '04.07.2022',
                                style: TextStyle(color: Colors.black45)),
                          ],

                        ),
                      ],
                    ),

                    // SizedBox(
                    //   height: 20,
                    // ),
                    // ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.grey01),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 40),
        //   width: double.infinity,
        //   height: 10,
        //   decoration: BoxDecoration(
        //     color: Color(MyColors.bg03),
        //     borderRadius: BorderRadius.only(
        //       bottomRight: Radius.circular(10),
        //       bottomLeft: Radius.circular(10),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

List<Map> categories = [
  {'icon': Icons.download, 'text': ' '},
  {'icon': Icons.analytics, 'text': ' '},
  {'icon': Icons.refresh, 'text': ' '},
  {'icon': Icons.menu, 'text': ' '},

];

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var category in categories)
          CategoryIcon(
            icon: category['icon'],
            text: category['text'],
          ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg01),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, July 29',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  IconData icon;
  String text;

  CategoryIcon({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(MyColors.bg01),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(MyColors.bg),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color(MyColors.primary),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Color(MyColors.purple02),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor or health issue',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserIntro extends StatelessWidget {
  const UserIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/person.jpeg'),
            ),
             SizedBox(
              height: 50,
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(1,10,10,10),
              child: Text(
                'BRYAN SIMONIS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
              Padding(
                padding: EdgeInsets.fromLTRB(70,08,0,0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black45,
                  size: 25,
                ),
              ),

          ],
        ),

      ],
    );
  }
}
