import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
//StatefulWidget용 메서드
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  //이부분이 갱신되는 뷰 - private 으로 지정
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('현재 : MainView'),
            ElevatedButton(
                child: Text('DetailView(개인)'),
                onPressed: () {
                  // controller의 메서드 작동시키기
                }),
          ],
        ),
      ),
    );
  }
}
