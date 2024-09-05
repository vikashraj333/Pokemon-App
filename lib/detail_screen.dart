import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Constants/landscape_container.dart';
//import 'package:flutter_application_1/Constants/poke_type_container.dart';
import 'package:flutter_application_1/Constants/portrait_container.dart';
import 'package:flutter_application_1/Constants/row_styling.dart';
import 'package:flutter_application_1/Constants/stats_row.dart';
import 'package:flutter_application_1/Constants/text_style.dart';

class DetailScreen extends StatelessWidget {
  final dynamic data;
  const DetailScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                child: orientation == Orientation.portrait
                    ? portraitContainer(data)
                    : landscapeContainer(data),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: "About"),
                          Tab(text: "Base Stats"),
                        ]),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              normalText(
                                 data["xdescription"],
                                  Colors.black,
                                  16),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Card(
                                    color: lightGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              headingText(
                                                  "Height", Colors.grey, 16),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              headingText(
                                                  data["height"], Colors.grey, 16),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              headingText(
                                                  "Weight", Colors.grey, 16),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              headingText(
                                                  data["weight"], Colors.grey, 16),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              headingText("Breeding", black, 16),
                              const SizedBox(
                                height: 30,
                              ),
                              rowStyle("Gender", "Male"),
                              rowStyle("Egg Cycle", data["egg_groups"]),
                              rowStyle("Evolved from", data["evolvedfrom"]),
                              rowStyle("Base EXP", data["base_exp"]),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              statsRow("HP", data["hp"]),
                              statsRow("Attack", data["attack"]),
                              statsRow("Defence", data["defense"]),
                              statsRow("Speed", data["speed"]),
                              statsRow("Special Attack", data["special_attack"]),
                              totalRow("Total", data["total"]),
                              // statsRow("HP", 70),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
