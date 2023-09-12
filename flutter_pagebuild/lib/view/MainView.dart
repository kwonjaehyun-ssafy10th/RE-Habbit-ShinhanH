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
        fontFamily: '아리따-돋움',
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double blankHeight = screenHeight * 0.02;
    double blankWidth = screenWidth * 0.05;
    double startHeight = screenHeight * 0.1;
    double contentWidth = screenWidth * 0.8;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: startHeight,
              ),
              // const HeaderWidget(),
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
                      child: const Text(
                        '랭킹보기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: blankWidth,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.goToStamp();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            const Color.fromARGB(255, 153, 255, 180)),
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

              SizedBox(
                height: blankHeight,
              ),

              // 달성률 관련 위젯들 묶음
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 234, 244, 255),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 209, 209, 209)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    width: screenWidth,
                    height: screenHeight * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: blankHeight,
                        ),
                        // 달성률 현황
                        const Text(
                          '현재 달성률 🏃‍♀️',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 0, 113, 206),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        // !! 성공률 변수 넣기 !!
                        const Text(
                          // '챌린지성공 ${succRate} % \n적금성공 ${moneyRate} % \n',
                          '챌린지성공 80 % + 적금 10 %',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 60,
                    child: PieChart(
                      // 달성률 차트
                      chartType: ChartType.ring,
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 800),
                      colorList: colorList,
                      chartLegendSpacing: 50,
                      chartRadius: contentWidth / 3,
                      initialAngleInDegree: 0,
                      ringStrokeWidth: 60,

                      // 범례
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValueBackground: false,
                          showChartValues: false,
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                          chartValueStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),

              // 현재 진행중인 챌린지 및 이미지
              Image.asset(
                'assets/images/main-image.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// !! 비율 데이터 여기에 넣으면 된다 !!
// 파이차트 데이터
Map<String, double> dataMap = {
  "챌린지성공": 80.0,
  "적금": 10.0,
  "실패": 10.0,
};

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
// 안 띄우는 게 나을수도
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(context) {
    return const Text('오늘도 갓생 가자');
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '시계토끼 ',
              // '${user_name}'
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              '님',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
