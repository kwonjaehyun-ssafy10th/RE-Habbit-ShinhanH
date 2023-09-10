import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/controller/RankController.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/StampController.dart';

class StampView extends StatelessWidget {
  const StampView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StampController>();

    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.find<RankController>().goToMain();
              },
              child: const Text('goToMain'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.work("test성공");
              },
              child: Obx(
                () => const Text('작동안함'),
              ),
            ),
          ]),
    ));
  }
}
