import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/controller/RankController.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

class RankView extends StatelessWidget {
  const RankView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RankController>();
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

            ElevatedButton(onPressed: () {}, child: Text('작동 안함')),

          ]),
    ));
  }
}
