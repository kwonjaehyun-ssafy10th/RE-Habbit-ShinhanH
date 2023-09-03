import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTemp extends StatefulWidget {
  @override
  _ScreenTempState createState() => _ScreenTempState();
}

class _ScreenTempState extends State<ScreenTemp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen Two'),
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
