import 'package:doctor_consultation_app/screens/Signup/components/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation_app/components/text_field_container.dart';
import 'package:doctor_consultation_app/widgets/constant.dart';
import 'package:http/http.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Widget child;
  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.child,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
