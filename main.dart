import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_expo/config/asset.dart';
import 'package:project_expo/screen/calendar_screen.dart';
import 'package:project_expo/screen/dashboard.dart';
import 'package:project_expo/screen/home_screen.dart';
import 'package:project_expo/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Asset.colorPrimaryDark,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
