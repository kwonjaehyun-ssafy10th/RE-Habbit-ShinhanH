import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPage3 extends StatefulWidget {
  @override
  _ScreenPage3State createState() => _ScreenPage3State();
}

class _ScreenPage3State extends State<ScreenPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen 3 - 랭킹'),
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
