import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/controller/RegisController.dart';
import 'package:flutter_pagebuild/view/RegisView.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the UserController
    Get.lazyPut<RegisController>(() => RegisController());
    return GetMaterialApp(
      title: 'GetX MVC Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegisView(),
    );
  }
}
