import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPage1 extends StatefulWidget {
  @override
  _ScreenPage1State createState() => _ScreenPage1State();
}

class _ScreenPage1State extends State<ScreenPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('텍스트 체크용'),
            Text('Screen 1 - 개인'),
            Text('절약 금액, Rabbit 적금 현황, 달성율, 예상 우대 이율'),
            ElevatedButton(
              onPressed: () {
                // if(Navigator.of(context).canPop()){
                // Navigator.of(context).pop();
                // }

                Get.back();
              },
              child: Text(
                '뒤로가기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
