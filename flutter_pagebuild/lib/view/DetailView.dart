import 'package:flutter/material.dart';
//import 'package:flutter_pagebuild/view/flutter/dev/bots/utils.dart';

import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/DetailController.dart';
import 'package:pie_chart/pie_chart.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key}) : super(key: key);
  final controller = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double blankHeight = screenHeight * 0.03;
    double blankWidth = screenWidth * 0.05;
    double startHeight = screenHeight * 0.27;
    double contentWidth = screenWidth * 0.5;

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: startHeight,
              // color: Colors.red,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset('assets/images/profile-img.png',
                        width: contentWidth, fit: BoxFit.contain),
                  ),
                  SizedBox(
                    width: blankWidth,
                  ),
                  Container(
                    // alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Date of Birth',
                          style: TextStyle(fontSize: 23, color: Colors.purple),
                        ),
                        Text('2023.03.22'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //> 절약금액 >Rabbit >달성율 >예상우대이율

            Container(
              padding: EdgeInsets.only(left: 30),
              width: fullDegree,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //>절약금액
                  Container(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Detail 글자 부분

                        Text('Detail',
                            style: TextStyle(fontSize: 30, color: Colors.grey)),
                        Text(
                          '',
                          style: TextStyle(fontSize: 8),
                        ),
                        Text('> 절약금액',
                            style:
                                TextStyle(fontSize: 20, color: Colors.purple)),
                        //절약금액 수정 사항(w/Controller)
                        Text('약 500,000원'),
                        Text('(추산치)')
                      ],
                    ),
                  ),

                  SizedBox(
                    height: blankHeight,
                  ),
                  //>Rabbit 적금 현황
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('> Rabbit 적금 현황',
                            style:
                                TextStyle(fontSize: 20, color: Colors.purple)),
                        Text('75,000원',
                            style:
                                TextStyle(fontSize: 17, color: Colors.black87)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: blankHeight,
                  ),
                  //>달성율(성공+적금)
                  // c챌린지 성공 적금 성공
                  // 그래프로 해도 좋을듯
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('> 달성율(성공+적금)',
                            style:
                                TextStyle(fontSize: 20, color: Colors.purple)),
                        Text('100%',
                            style:
                                TextStyle(fontSize: 17, color: Colors.black87)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: blankHeight,
                  ),
                  //>예상 우대 이율
                  // --> 이걸 뺴고 달성율을 소비 적금 기준으로 나눠서 하기.(자세하게)
                  //아이콘을 넣는다거나 박스처리를 하거나 글자를 조금더 색깔 다르게 글자 크기 차이 주고
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('> 예상 우대이율',
                            style:
                                TextStyle(fontSize: 20, color: Colors.purple)),
                        Text('연 4.5%',
                            style:
                                TextStyle(fontSize: 17, color: Colors.black87)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],

          // children: <Widget>[
          //   ElevatedButton(
          //     onPressed: () {
          //       Get.find<DetailController>().goToMain();
          //     },
          //     child: const Text('goToMain'),
          //   ),
          //   ElevatedButton(
          //       onPressed: () {
          //         //controller.work("test성공");
          //       },
          //       child: const Text('작동안함')),
          // ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     Get.find<DetailController>().goToMain();
            //   },
            //   child: const Text('goToMain'),
            // ),
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
        var controller = Get.find<DetailController>();
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
