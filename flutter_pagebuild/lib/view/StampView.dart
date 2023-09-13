import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/StampController.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

class StampView extends StatelessWidget {
  StampView({Key? key}) : super(key: key);

  final controller = Get.find<StampController>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double blankWidth = screenWidth * 0.25;
    double HeaderWidth = screenWidth * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        backgroundColor: Colors.white,
        toolbarHeight: 130,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
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
          ],
        ),
      ),
    );
  }
}

// 로고 누르면 메인으로 돌아가게 함 (기능 추가)
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        var controller = Get.find<StampController>();
        controller.goToMain();
      },
      icon: Image.asset(
        'assets/images/logo-image.png',
        // height: 2000,
      ),
      iconSize: 200,
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(30),
      crossAxisCount: 3,
      childAspectRatio: 1, // 가로:세로 비율 설정
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
      // physics: FixedExtentScrollPhysics(),
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

// 데이터 받을 때마다 이 부분 수정하기
class Stamps extends StatelessWidget {
  const Stamps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(30),
      crossAxisCount: 3,
      childAspectRatio: 1, // 가로:세로 비율 설정
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
      children: List.generate(5, (index) {
        String imageName;
        // 적용예시) n-1 일차가 rabbit 일 때
        // if (index == n-1) {
        //   imageName = 'assets/images/rabbit-stamp.png'; // 첫 번째 이미지
        // }
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

// 수정된 스탬프 받아오기 (달력은 그대로)
class CalendarAndStamps extends StatelessWidget {
  const CalendarAndStamps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Calendar(),
        Stamps(),
      ],
    );
  }
}
