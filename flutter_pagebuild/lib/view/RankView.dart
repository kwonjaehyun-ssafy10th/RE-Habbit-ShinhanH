import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/controller/RankController.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';
// import 'package:sorted_list/sorted_list.dart';
import 'package:categorized_dropdown/categorized_dropdown.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//dropdown
import 'package:multi_dropdown/multiselect_dropdown.dart';

class RankView extends StatelessWidget {
  RankView({Key? key}) : super(key: key);

  final controller = Get.find<RankController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double blankHeight = screenHeight * 0.02;
    double blankWidth = screenWidth * 0.05;
    double startHeight = screenHeight * 0.1;
    double startWidth = screenWidth * 0.1;
    double contentWidth = screenWidth * 0.8;

    // final controller = Get.find<RankController>();
    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // SizedBox(height: 16),
            //더보기버튼
            Container(
              // color: Colors.blue,
              height: startHeight,
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('ㅎㅎ'),
                  Container(
                    child: SeeMoreBtn(),
                    height: startHeight * 0.4,
                    width: screenWidth * 0.4,
                    color: Colors.amber,
                  )
                ],
              ),
            ),

            //평균 Rabbit Text
            Container(
              // color: Colors.amber,
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paddingOnly(left: 10),
                  Text(
                    '평균 Rabbit 지속 시간',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '상위%      기간',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
            //평균 Rabbit Graph
            //(w/Controller)
            Container(child: RankGraph1()),
            //Rabbit 모은 금액 Text
            Container(
              child: Column(
                children: const [Text('Rabbit으로 모은 금액'), Text('상위% 금액')],
              ),
            ),
            //Rabbit 모은 금액 Graph
            //(w/Controller)

            Container(child: RankGraph2()),

            Container(
              child: ElevatedButton(
                onPressed: () {
                  Get.find<RankController>().goToMain();
                },
                child: Text('goToMain'),
              ),
            )
          ],
        ),
      ),

      // ElevatedButton(
      //   onPressed: () {
      //     Get.find<RankController>().goToMain();
      //   },
      //   child: Text('goToMain'),

      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.share),
      //       label: '친구에게 공유하기',
      //     ),
      //   ],
      // ),
    );
  }
}

//더보기 버튼_provider
//https://pub.dev/packages/dropdown_button2

class SeeMoreBtn extends StatefulWidget {
  const SeeMoreBtn({super.key});

  @override
  State<SeeMoreBtn> createState() => _SeeMoreBtnState();
}

class _SeeMoreBtnState extends State<SeeMoreBtn> {
  final List<String> items = [
    '커피',
    '여성',
    '남성',
    '10대',
    '20대',
    '30대',
    '40대',
    '50대 이상',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Color.fromARGB(255, 28, 28, 28),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    '전체',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 28, 28, 28),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                // border: Border.all(
                //   color: Colors.black26,
                // ),
                color: Color.fromARGB(255, 190, 227, 236),
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Color.fromARGB(255, 28, 28, 28),
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color.fromARGB(255, 190, 227, 236),
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}
// void setState(Null Function() param0) {}

//평균 Rabbit Graph
class RankGraph1 extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RankGraph1({Key? key}) : super(key: key);

  @override
  RankGraph1State createState() => RankGraph1State();
}

class RankGraph1State extends State<RankGraph1> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      //Controller, Data 유기적으로 작동해야 할 부분
      //고정값(3개)
      _ChartData('~40%', 6.4),
      _ChartData('~20%', 12),
      _ChartData('~10%', 15),

      //(w/Controller)
      _ChartData('~5%🥕', 30),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 5),
      tooltipBehavior: _tooltip,
      series: <ChartSeries<_ChartData, String>>[
        BarSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          name: 'Gold',
          color: Color.fromRGBO(159, 205, 243, 1),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

//Rabbit 모은 금액 Graph
class RankGraph2 extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RankGraph2({Key? key}) : super(key: key);

  @override
  RankGraph2State createState() => RankGraph2State();
}

class RankGraph2State extends State<RankGraph2> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      //고정값
      _ChartData('~40%', 6.4),
      _ChartData('~20%', 12),
      //(w/Controller)
      _ChartData('~10%🥕', 15),
      //고정값
      _ChartData('~5%', 30),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 5),
      tooltipBehavior: _tooltip,
      series: <ChartSeries<_ChartData, String>>[
        BarSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          name: 'Gold',
          color: Color.fromRGBO(159, 205, 243, 1),
        ),
      ],
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
        var controller = Get.find<RankController>();
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
