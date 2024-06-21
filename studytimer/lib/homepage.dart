import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'menu.dart';
import 'package:wakelock/wakelock.dart';
import 'function.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'datafunction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (firstTouched == false) {
          firstTouched = true;
          Timer.periodic(const Duration(milliseconds: 100), (timer) {
            print("updatestart");
            setState(() {});
          });
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF181a33),
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight / 844 * 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 390 * 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (firstTouched == false) {
                              firstTouched = true;
                              Timer.periodic(const Duration(milliseconds: 100),
                                  (timer) {
                                print("updatestart");
                                setState(() {});
                              });
                            }

                            Get.to(() => const Menu(),
                                transition: Transition.leftToRight);
                          },
                          child: const Icon(
                            Icons.menu_rounded,
                            color: Color(0xFFff9d35),
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              resetButton();
                            });
                          },
                          child: const Icon(
                            Icons.refresh_rounded,
                            color: Color(0xFFff9d35),
                            size: 50,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 390 * 20,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight / 844 * 50,
                ),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "총 공부시간",
                          style: TextStyle(
                              fontSize: 33,
                              color: Color(0xFFF4EDDB),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          secLenth(totalSeconds),
                          style: const TextStyle(
                            fontSize: 35,
                            color: Color(0xFFF4EDDB),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 844 * 50,
                ),
                Container(
                  //sub2
                  width: screenWidth - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF4EDDB),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subjects[0].name,
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                secLenth(subjects[0].seconds),
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  startButton(0);
                                },
                                child: subjects[0].iconSelect(),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                SizedBox(height: screenHeight / 844 * 25),
                Container(
                  //sub2
                  width: screenWidth - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF4EDDB),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subjects[1].name,
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                secLenth(subjects[1].seconds),
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  startButton(1);
                                },
                                child: subjects[1].iconSelect(),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                SizedBox(height: screenHeight / 844 * 25),
                Container(
                  //sub3
                  width: screenWidth - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF4EDDB),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subjects[2].name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              secLenth(subjects[2].seconds),
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                startButton(2);
                              },
                              child: subjects[2].iconSelect(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight / 844 * 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
