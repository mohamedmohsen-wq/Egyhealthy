import 'package:flutter/material.dart';

import 'componnents/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.suffix,
      this.hint,
      required this.Bordercolor1,
      required this.Bordercolor2});

  String? hint;
  IconData? suffix;
  bool ispassword = false;
  Color Bordercolor1;
  Color Bordercolor2;
  Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: ispassword,
        decoration: InputDecoration(
          suffixIconColor: kPrimarycolor,
          suffixIcon: Icon(suffix),
          labelStyle: TextStyle(color: Color(0xffD0D0D0), fontSize: 12),
          hintText: hint,
          hintStyle: TextStyle(color:hintColor ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:const BorderSide(
                 color: kPrimarycolor,
              )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Bordercolor2),
              borderRadius: BorderRadius.circular(25)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Bordercolor2,
              ),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
