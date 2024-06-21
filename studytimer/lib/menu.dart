import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'datafunction.dart';
import 'package:get/get.dart';
import 'function.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF4EDDB),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight / 844 * 70,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 390 * 30,
                        ),
                        const Text(
                          "설정",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 38,
                              color: Color(0xFF181a33)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Color(0xFF181a33),
                            size: 50,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 390 * 30,
                        ),
                      ],
                    ),
                  ]),
              SizedBox(
                height: screenHeight / 844 * 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth / 390 * 15,
                      ),
                      const Text(
                        "과목 설정 변경",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: screenHeight / 844 * 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // changeData(0);
                        },
                        child: const Icon(
                          Icons.ac_unit_outlined,
                          color: Colors.black,
                          size: 80,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
