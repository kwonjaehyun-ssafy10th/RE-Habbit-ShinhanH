import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/DetailController.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailController>();

    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.find<DetailController>().goToMain();
              },
              child: Text('goToMain'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.work("test성공");
              },
              child: Obx(
                () => Text('${controller.mainDB.value.detailTest}'),
              ),
            ),
          ]),
    ));
  }
}
