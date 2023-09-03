import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPage2 extends StatefulWidget {
  @override
  _ScreenPage2State createState() => _ScreenPage2State();
}

class _ScreenPage2State extends State<ScreenPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen 2 - 스탬프'),
            Text('해당 월별 일자/일별 소비에 따른 스탬프 자동 생성, 랭킹 페이지 연결 배너'),
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
