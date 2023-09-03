import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/ScreenTemp.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyWidget(),
      getPages: [
        GetPage(
          name: '/',
          page: () => ScreenTemp(),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              child: Text('testButton'),
              onPressed: () {
                Get.to(ScreenTemp());
              })),
    );
  }
}
