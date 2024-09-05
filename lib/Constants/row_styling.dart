import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Constants/text_style.dart';

Widget rowStyle(
String? text, String? value
){
  return Row(
    children: [
      SizedBox(width:100,
      child:  headingText(text, grey, 16)),
      headingText(value, grey, 16),
    ],
  );
}