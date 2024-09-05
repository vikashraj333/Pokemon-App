import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/text_style.dart';

Widget typeContainer(
  String? text , Color? color, double? size 
){
  return Container(
    padding:  const EdgeInsets.symmetric(horizontal: 16,vertical: 4),  
    decoration: BoxDecoration(
      color:Colors.white.withOpacity(0.30),
      borderRadius: BorderRadius.circular(12),
    ),
    child: normalText(text, color, size),
  );
}