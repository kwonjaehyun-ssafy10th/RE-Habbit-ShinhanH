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
              height: 10,
            ),
            Text(
              '🥕 현재 당근 수 2개 🥕',
              // '현재 당근 수 {$carrotCnt}개'
              style: TextStyle(
                fontSize: 20,
              ),
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
        String imageName;
        if (index == 0) {
          imageName = 'assets/images/rabbit-stamp.png'; // 첫 번째 이미지
        } else if (index == 1) {
          imageName = 'assets/images/rabbit-stamp.png'; // 두 번째 이미지
        } else if (index == 2) {
          imageName = 'assets/images/rabbit-stamp.png'; // 세 번째 이미지
        } else if (index == 3) {
          imageName = 'assets/images/carrot-stamp.png'; // 네 번째 이미지
        } else {
          imageName = 'assets/images/carrot-stamp.png'; // 다섯 번째 이미지
        }

        return Center(
          child: Container(
            child: Image.asset(imageName),
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

