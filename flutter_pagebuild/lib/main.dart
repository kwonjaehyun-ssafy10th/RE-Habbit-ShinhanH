import 'package:flutter/material.dart';

import 'package:flutter_pagebuild/controller/RegisController.dart';
import 'package:flutter_pagebuild/view/DetailVeiw.dart';
import 'package:flutter_pagebuild/view/MainView.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: login(),
      getPages: [
        GetPage(
          name: '/',
          page: () => MainView(),
        ),
        GetPage(
          name: '/',
          page: () => MainView(),
        ),
      ],
    );
  }
}

class login extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return Scaffold();
  }
}

class MyWidget extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    final controller = Get.put(Controller_Main());

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // ElevatedButton(
          // child: Text('테스트 버튼'),
          // onPressed: () {
          //  "${controller.testS.value}",
          // }),

          GetBuilder<Controller_Main>(builder: (controller) {
            return Text('${controller.testS.value}');
          }),
          ElevatedButton(
              child: Text('테스트 버튼'),
              onPressed: () {
                controller.increment;
              }),

          ElevatedButton(
              child: Text('개인'),
              onPressed: () {
                Get.to(ScreenPage1());
              }),
          ElevatedButton(
              child: Text('스탬프'),
              onPressed: () {
                Get.to(ScreenPage2());
              }),
          ElevatedButton(
              child: Text('랭킹'),
              onPressed: () {
                Get.to(ScreenPage3());
              }),
        ]),
      ),
    );
  }
}
