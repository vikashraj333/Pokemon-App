import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/images.dart';
import 'package:flutter_application_1/Constants/poke_type_container.dart';
import 'package:flutter_application_1/Constants/text_style.dart';

Widget portraitContainer(data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      headingText(data["name"], Colors.white, 36),
      Row(
        children: [
          typeContainer("Grass", Colors.white, 16),
          const SizedBox(
            width: 6,
          ),
          typeContainer("Posion", Colors.white, 16),
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/pokeball.png',
              width: 200,
              color: Colors.white.withOpacity(0.5),
            ),
           imageNetwork(data["imageurl"]),
          ],
        ),
      ),
    ],
  );
}
