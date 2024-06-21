import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';
import 'homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'datafunction.dart';

void main() async {
  await Hive.initFlutter();
  var sub = await Hive.openBox('sub');
  var ts = await Hive.openBox('ts');
  initHive();
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MainApp',
      theme: ThemeData(useMaterial3: true, fontFamily: 'pretendard'),
      home: const HomePage(title: 'MainApp'),
    );
  }
}
