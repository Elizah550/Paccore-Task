import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/widgets/constant.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minimumSize: Size(50, 30),
              //color: color,
              // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // alignment: Alignment.centerLeft),


          //onPressed: (){press();},

          ),
          onPressed: () { press(); },
          child:  Text(
             text,
        style: TextStyle(color: textColor),
        ),
      ),
    ),);
  }
}
