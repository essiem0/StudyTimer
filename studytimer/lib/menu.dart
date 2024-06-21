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

InputBorder tborder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFF181a33),
    width: 1,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight / 844 * 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "1   ",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            width: screenWidth - 80,
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 27),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextField(
                                                    cursorColor: Colors.black
                                                        .withOpacity(0.5),
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: '과목 이름을 입력해주세요',
                                                      // focusedBorder: tborder,
                                                      // enabledBorder: tborder,
                                                      // border: tborder
                                                    ),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    onSubmitted: (value) {
                                                      setState(() {
                                                        subjects[0].name =
                                                            value;
                                                      });
                                                    },
                                                  ),
                                                  const SizedBox(height: 10),
                                                  TextField(
                                                    cursorColor: Colors.black
                                                        .withOpacity(0.5),
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: '목표 시간을 입력해주세요',
                                                      // enabledBorder: tborder,
                                                      // border: tborder
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onSubmitted: (value) {
                                                      setState(() {
                                                        print(value);
                                                        print(int.parse(value));
                                                        subjects[0].seconds =
                                                            int.parse(value) *
                                                                60;

                                                        subjects[0].fixsec =
                                                            int.parse(value) *
                                                                60;
                                                      });
                                                    },
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ])
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
          ),
        ));
  }
}
