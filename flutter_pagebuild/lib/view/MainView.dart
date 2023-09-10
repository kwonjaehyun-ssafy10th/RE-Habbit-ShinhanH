import 'package:flutter/material.dart';

import 'package:flutter_pagebuild/controller/MainController.dart';
// import 'package:fl_chart/fl_chart.dart';

import 'package:get/get.dart';
import 'dart:math';
import 'package:pie_chart/pie_chart.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

final controller = Get.find<MainController>();

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Chart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),

              const HeaderWidget(),
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
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            const Color.fromARGB(255, 233, 255, 133)),
                      ),
                      child: const Text(
                        '랭킹보기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.goToStamp();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            const Color.fromARGB(255, 197, 255, 249)),
                      ),
                      child: const Text(
                        '현황보기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 달성률 차트
              const Text(
                '현재 달성률 🏃‍♀️ | 90%',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              PieChart(
                dataMap: resetMainModel.inst.sucRate,
                animationDuration: const Duration(milliseconds: 800),
                colorList: colorList,
                chartLegendSpacing: 20,
                chartRadius: MediaQuery.of(context).size.width / 2,
                initialAngleInDegree: 0,
                ringStrokeWidth: 32,
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                ),
                chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                    chartValueStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),

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

              // ElevatedButton(
              //   onPressed: () {
              //     controller.work("test성공");
              //   },
              //   child: Obx(
              //     // () => Text('${controller.mainBD.value.test}'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// 파이차트 데이터

//Map자체를 가져오는 걸로 변경할 것임
// Map<String, double> dataMap = {
//   '성공': resetMainModel.inst.sucRate[0],
//   '적금': resetMainModel.inst.sucRate[1],
//   '실패': resetMainModel.inst.sucRate[2]
// };
// 파이차트 색상
final colorList = <Color>[
  const Color.fromARGB(255, 68, 136, 255),
  const Color.fromARGB(255, 148, 218, 255),
  const Color.fromARGB(255, 157, 157, 157),
];

// 헤더위젯
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(context) {
    return const Text('[캐치프레이즈] 좋은 습관이 ~~ ');
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
          // '${user_name} 님'
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
