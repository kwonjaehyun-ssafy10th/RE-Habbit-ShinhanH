import 'package:flutter/material.dart';

import 'package:flutter_pagebuild/controller/MainController.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //버튼들

            ElevatedButton(
              onPressed: () {
                controller.work("test성공");
              },
              child: Obx(
                () => Text('${controller.mainBD.value.test}'),
              ),
            ),
            //하단부는 화면 전환 위한 버튼들
            ElevatedButton(
              onPressed: () {
                controller.goToDetail();
              },
              child: Text('goToDetail'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.goToRank();
              },
              child: Text('goToRank'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.goToStamp();
              },
              child: Text('goToStamp'),
            ),
          ],
        ),
      ),
    );
  }
}
