import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Constants/images.dart';
import 'package:flutter_application_1/Constants/poke_type_container.dart';
import 'package:flutter_application_1/Constants/text_style.dart';
import 'package:flutter_application_1/api_service.dart';
import 'package:flutter_application_1/detail_screen.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Pokemon-App",
                style: TextStyle(fontFamily: "circula_bold", fontSize: 36.0),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: FutureBuilder(
                  future: getAPI(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: width < 600
                                ? 2
                                : width < 1100
                                    ? 4
                                    : 6,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            data: data[index],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: -20,
                                    right: -20,
                                    child: Image.asset(
                                      "assets/pokeball.png",
                                      width: 150,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: imageNetwork(data[index]["imageurl"]),
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        headingText(data[index]["name"],
                                            Colors.white, 24.0),
                                        typeContainer(
                                            "Grass", Colors.white, 16),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        typeContainer(
                                            "Poison", Colors.white, 16)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(lightGreen),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
