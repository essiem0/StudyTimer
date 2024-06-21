import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'datafunction.dart';

class Subject {
  int subNum;
  int fixsec;
  int seconds;
  String name;
  Timer? timer;
  bool runTimer = false;

  Subject(
      {required this.subNum,
      required this.name,
      required this.seconds,
      required this.fixsec});

  Icon iconSelect() {
    return !runTimer
        ? const Icon(
            CupertinoIcons.arrowtriangle_right_circle_fill,
            color: Color(0xFFff9d35),
            size: 60,
          )
        : const Icon(
            Icons.pause_circle_outline,
            color: Color(0xFFff9d35),
            size: 60,
          );
  }

  void tStart() {
    stopOtherbuttons(subNum);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (runTimer) {
        seconds--;
        totalSeconds++;
        reputData(subNum, name, seconds, fixsec, totalSeconds);
        print(subjects[subNum].seconds);
        print(totalSeconds);

        if (seconds == 0) {
          tReset();
        }
      }
    });
  }

  void tPause() {
    runTimer = false;
    timer?.cancel();
    print(subjects[subNum].seconds);
  }

  void tReset() {
    timer?.cancel();
    runTimer = false;
    seconds = fixsec;
    reputData(subNum, name, seconds, fixsec, totalSeconds);
    initHive();
  }
}

void resetButton() {
  subjects[0].tReset();
  subjects[1].tReset();
  subjects[2].tReset();
  totalSeconds = 0;
}

String secLenth(int seconds) {
  return (seconds % 60 < 10)
      ? "${seconds ~/ 60}:0${seconds % 60}"
      : "${seconds ~/ 60}:${seconds % 60}";
}

void startButton(int subNum) {
  subjects[subNum].runTimer = !subjects[subNum].runTimer;
  if (subjects[subNum].runTimer) {
    subjects[subNum].tStart();
  } else {
    subjects[subNum].tPause();
  }
}

void stopOtherbuttons(int a) {
  for (int i = 0; i < 3; i++) {
    if (i != a) {
      subjects[i].tPause();
    }
  }
}
