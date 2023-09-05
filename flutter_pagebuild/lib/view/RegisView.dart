import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/RegisController.dart';

class RegisView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisController>();

    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                controller.goToMain();
              },
              child: Text('goToMain'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.work("test성공");
              },
              child: Obx(
                () => Text('${controller.regis.value.test}'),
              ),
            ),
          ]),
    ));
  }
}
