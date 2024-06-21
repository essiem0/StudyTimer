import 'package:hive_flutter/hive_flutter.dart';
import 'function.dart';

final _sub = Hive.box('sub');
final _ts = Hive.box('ts');
int defaultTime = 60;

void initData() {
  for (int i = 0; i < 3; i++) {
    _sub.put(i, {
      'name': "과목 ${i + 1}",
      'seconds': defaultTime * 60,
      'fixsec': defaultTime * 60,
    });
  }
  _ts.put(0, 0);
}

Map readData(int key) {
  return (_sub.get(key));
}

// void initHive() {
//   if (_sub.)
// }

void initHive() {
  if (_sub.isEmpty) {
    initData();
  }
  for (int i = 0; i < 3; i++) {
    print(subjects[i].name);
    print(subjects[i].seconds);
    print(subjects[i].fixsec);
    print(totalSeconds);
  }
}

List<Subject> subjects = [
  Subject(
      subNum: 0,
      name: readData(0)['name'],
      seconds: readData(0)['seconds'],
      fixsec: readData(0)['fixsec']),
  Subject(
      subNum: 1,
      name: readData(1)['name'],
      seconds: readData(1)['seconds'],
      fixsec: readData(1)['fixsec']),
  Subject(
      subNum: 2,
      name: readData(2)['name'],
      seconds: readData(2)['seconds'],
      fixsec: readData(2)['fixsec']),
];

int totalSeconds = (_ts.isEmpty) ? 0 : _ts.get(0);

void changeData(int n, String name, int seconds, int fixsec) {
  _sub.put(n, {
    'name': name,
    'seconds': seconds,
    'fixsec': fixsec,
  });
  subjects[n] = Subject(
      subNum: n,
      name: readData(n)['name'],
      seconds: readData(n)['seconds'],
      fixsec: readData(n)['fixsec']);
}

void reputData(int n, String name, int seconds, int fixsec, int ts) {
  _sub.put(n, {
    'name': name,
    'seconds': seconds,
    'fixsec': fixsec,
  });
  _ts.put(0, ts);
}
