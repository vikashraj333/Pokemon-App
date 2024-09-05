import 'package:flutter/material.dart';

Widget headingText(
  String? name, Color? color, double? size  
) {
  return Text(
    name!,
    style: TextStyle(
      fontSize: size,
      fontFamily: "circula_bold",
      color: color,
    ),
  );
}

Widget normalText(
  String? text, Color? color, double? size  
) {
  return Text(
    text!,
    style: TextStyle(
      fontSize: size,
      fontFamily: "circula",
      color: color,
    ),
  );
}