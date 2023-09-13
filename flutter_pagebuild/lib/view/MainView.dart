import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_pagebuild/controller/MainController.dart';
// import 'package:fl_chart/fl_chart.dart';

import 'package:get/get.dart';
import 'dart:math';
import 'package:pie_chart/pie_chart.dart';

final controller = Get.find<MainController>();

//ChangeNotifierProvider 의 위젯으로 반환(view 없음)
class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //초기값 설정용
    controller.reset.resetPieChartMap();
    return ChangeNotifierProvider<resetMainModel>(
      create: (context) => resetMainModel(),
      child: MaterialApp(
        title: 'Flutter Chart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: '아리따-돋움',
        ),
        home: const MyHomePage(title: 'Flutter Chart'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
                        print('test');
                        controller.reset.temptest();
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
                        '스탬프 보기',
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

              Consumer<resetMainModel>(builder: (context, resetmodel, child) {
                return
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
                            offset: const Offset(
                                0, 7), // changes position of shadow
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
                          //const 삭제했음 - 담비
                          Text(
                            '현재 달성률 ${controller.reset.getSucSavRate}% 🏃‍♀️',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 0, 113, 206),
                            ),
                            textAlign: TextAlign.center,
                          ),

                          // !! 성공률 변수 넣기 !!
                          Text(
                            '챌린지성공 ${controller.reset.getSucRate} % + 적금 ${controller.reset.getsavinRate}%',
                            style: const TextStyle(
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

                        dataMap: controller.reset.getPieChartMap,

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
                );
              }), //스택종료

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
// 파이차트 데이터 Controller에서 가져올 것임

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
