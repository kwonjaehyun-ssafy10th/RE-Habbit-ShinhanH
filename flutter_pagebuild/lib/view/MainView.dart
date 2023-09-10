import 'package:flutter/material.dart';

import 'package:flutter_pagebuild/controller/MainController.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:get/get.dart';
import 'dart:math';

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
                      child: const Text('랭킹보기'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.goToStamp();
                      },
                      child: const Text('현황보기'),
                    ),
                  ],
                ),

              ),

              // 달성률 
              Stack(
                children: <Widget>[
                  PieChartWidget(industrySectors),
                  const Positioned(
                    top: 100,
                    left: 130,
                    child: Text(
                      '달성률 : n%',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ),
                ],
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

// 파이차트에 필요한 위젯들
class SectorRow extends StatelessWidget {
  const SectorRow(this.sector, {Key? key}) : super(key: key);
  final Sector sector;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28,
          child: CircleAvatar(
            backgroundColor: sector.color,
          ),
        ),
        const Spacer(),
        Text(sector.title),
      ],
    );
  }
}

class Sector {
  final Color color;
  final double value;
  final String title;

  Sector({required this.color, required this.value, required this.title});
}


List<double> get randomNumbers {
  final Random random = Random();
  final randomNumbers = <double>[];
  for (var i = 1; i <= 2; i++) {
    randomNumbers.add(random.nextDouble() * 100);
  }

  return randomNumbers;
}

List<Sector> get industrySectors {
  return [
    Sector(
        color: const Color.fromARGB(255, 69, 100, 255),
        value: randomNumbers[0],
        title: 'Information Technology'),
    Sector(
        color: const Color.fromARGB(255, 163, 163, 163),
        value: randomNumbers[1],
        title: 'Automobile'),
    
  ];
}
class PieChartWidget extends StatelessWidget {
  final List<Sector> sectors;

  const PieChartWidget(this.sectors, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.5, // 위치 조절
        child: PieChart(PieChartData(
          sections: _chartSections(sectors),
          centerSpaceRadius: 20.0, // 내부 원 크기 조절
        )));
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 70.0; // 전체 원 크기 조절
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: '',
      );
      list.add(data);
    }
    return list;
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
              // '${user_name} 님'
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ); 
  }
}