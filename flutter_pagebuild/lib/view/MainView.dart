import 'package:flutter/material.dart';

import 'package:flutter_pagebuild/controller/MainController.dart';
import 'package:get/get.dart';
import 'dart:math';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 상단 부분
            const HeaderWidget(),

            // 사용자명 부분
            const UserWidget(),

            // 마이페이지 버튼
            TextButton(
              onPressed: () {
                controller.goToDetail();
              }, 
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
              child: const Text('마이페이지'),
            ),

            // 랭킹 및 현황 버튼들
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.goToRank();
                    },
                    child: Text('랭킹보기'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.goToStamp();
                    },
                    child: Text('현황보기'),
                  ),
                ],
              ),

            ),
            

            // 달성률 그래프
            PieChart(),

            // 현재 진행중인 챌린지 및 이미지
            Stack(
              children: <Widget>[
                const Positioned(
                  top: 100,
                  left: 150,
                  child: Text(
                  '커피 사먹지 않기 진행 중...',
                  // '${challenge_name} 진행중'
                  style: TextStyle(
                    fontSize: 20,
                    ),
                  ),
                ),
                
                Image.asset(
                  'assets/images/main-image.png',
                  ),
              ],
            ),


            
            ElevatedButton(
              onPressed: () {
                controller.work("test성공");
              },
              child: Obx(
                () => Text('${controller.mainBD.value.test}'),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

// 헤더위젯
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(context) {
    return const Text(
      '[캐치프레이즈] 좋은 습관이 ~~ '
        ); 
  }
}

// 유저위젯
class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(context) {
    return const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '시계토끼 님',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ); 
  }
}

// 그래프 위젯
class PieChart extends CustomPainter {
  PieChart();

  int percentage = 0; 
  double textScaleFactor = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint() // 화면에 그릴 때 쓸 Paint를 정의합니다. 
        ..color = Colors.orangeAccent
        ..strokeWidth = 10.0 // 선의 길이를 정합니다. 
        ..style = PaintingStyle.stroke // 선의 스타일을 정합니다. stroke면 외곽선만 그리고, fill이면 다 채웁니다. 
        ..strokeCap = StrokeCap.round; // stroke의 스타일을 정합니다. round를 고르면 stroke의 끝이 둥글게 됩니다. 

    double radius = min(size.width / 2 - paint.strokeWidth / 2 , size.height / 2 - paint.strokeWidth/2); // 원의 반지름을 구함. 선의 굵기에 영향을 받지 않게 보정함. 
    Offset center = Offset(size.width / 2, size.height/ 2); // 원이 위젯의 가운데에 그려지게 좌표를 정함.

    canvas.drawCircle(center, radius, paint); // 원을 그림. 

    double arcAngle = 2 * pi * (percentage / 100); // 호(arc)의 각도를 정함. 정해진 각도만큼만 그리도록 함. 

    paint..color = Colors.deepPurpleAccent; // 호를 그릴 때는 색을 바꿔줌. 
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, paint); // 호(arc)를 그림.

    drawText(canvas, size, "$percentage / 100"); // 텍스트를 화면에 표시함.
  }

  // 원의 중앙에 텍스트를 적음.
  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr); 

    tp.layout(); // 필수! 텍스트 페인터에 그려질 텍스트의 크기와 방향를 정함.
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy); 
    tp.paint(canvas, offset);
  }

  // 화면 크기에 비례하도록 텍스트 폰트 크기를 정함.
  double getFontSize(Size size, String text) {
    return size.width / text.length * textScaleFactor;
  }

  @override
  bool shouldRepaint(PieChart old) {
    return old.percentage != percentage;
  }

  @override
  Widget build(context) {
    return;

  }
}
