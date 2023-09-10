import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/controller/RankController.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/StampController.dart';

// final controller = Get.find<StampController>();

class StampView extends StatelessWidget {
  const StampView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              '당근 모으는 중',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // 달력 위젯
            Stack(
              children: [
                Calendar(),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Stamps(),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          
          onPressed: () {
            // Handle button press
          },
          child: Text(
            '메인화면으로',
            style: TextStyle(
              fontSize: 20,
            ),
            
          ),
        ),
      );
      
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo-image.png',
      height: 150,
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(30),
      crossAxisCount: 3,
      childAspectRatio: 1, // 가로:세로 비율 설정
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화
      children: List.generate(30, (index) {
        return Center(
          child: Container(
            decoration: const ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(),
              ),
              color: Color.fromARGB(0, 219, 218, 218),
            ),
            width: 100, // 원의 크기를 조절
            height: 100, // 원의 크기를 조절
            padding: const EdgeInsets.all(20),
            child: Text(
              '${index + 1} 일차',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }),
    );
  }
}

class Stamps extends StatelessWidget {
  const Stamps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(30),
      crossAxisCount: 3,
      childAspectRatio: 1, // 가로:세로 비율 설정
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화
      children: List.generate(5, (index) {
        return Center(
          child: Container(
            child: Image.asset('assets/images/rabbit-stamp.png'),
          ),
        );
      }),
    );
  }
}


class CalendarAndStamps extends StatelessWidget {
  const CalendarAndStamps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Calendar(),
        Stamps(),
      ],
    );
  }
}

