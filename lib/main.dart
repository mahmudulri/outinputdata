import 'package:flutter/material.dart';
import 'package:ouripdata/homepage.dart';
import 'package:get/get.dart';
import 'package:ouripdata/senddata/googlesheet.dart';
import 'package:ouripdata/senddata/sendhome.dart';

void main() async {
  await SheetsFlutter.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}
