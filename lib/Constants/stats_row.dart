import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Constants/text_style.dart';

Widget statsRow(
  String? text, int? value
) {
  return Row(
    children: [
      SizedBox(width: 100, child: headingText(text, grey, 16)),
      SizedBox(width: 100, child: headingText(value.toString(), black, 16)),
      Stack(
        children: [
           Container(
          height: 3,
          width: 200 ,
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
          Container(
          height: 3,
          width: (value)?.toDouble() ,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        ],
      ),
    ],
  );
}

Widget totalRow(String? text,  int? value) {
   return Row(
    children: [
      SizedBox(width: 100, child: headingText(text, grey, 16)),
      SizedBox(width: 100, child: headingText(value.toString(), black, 16)),
      Stack(
        children: [
           Container(
          height: 3,
          width: 200 ,
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
          Container(
          height: 3,
          width: (value!/2).toDouble() ,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        ],
      ),
    ],
  );
}
