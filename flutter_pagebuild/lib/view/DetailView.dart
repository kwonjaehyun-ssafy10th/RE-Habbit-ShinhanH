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
    double blankHeight = screenHeight * 0.01;
    double blankWidth = screenWidth * 0.05;
    double startHeight = screenHeight * 0.27;
    double contentWidth = screenWidth * 0.5;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 247, 247),
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              // padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),

              height: startHeight,
              child: Column(
                // color: Colors.red,
                children: [
                  Container(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          // padding: EdgeInsets.only(right: 20),
                          child: Image.asset('assets/images/profile-img.png',
                              width: contentWidth, fit: BoxFit.contain),
                        ),
                        Container(
                          width: 1,
                          height: 130,
                          color: Colors.grey,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          // alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //챌린지 시작 날짜
                              Text(
                                '챌린지 시작 날짜',
                                style: TextStyle(
                                    fontSize: 23, color: Colors.purple),
                              ),
                              //여백
                              Text(
                                '',
                                style: TextStyle(fontSize: 10),
                              ),
                              //(w/controller)
                              Text(
                                '2023.03.22',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '',
                                style: TextStyle(fontSize: 30),
                              ),
                              //남은 날짜
                              Text(
                                '남은 날짜',
                                style: TextStyle(
                                    fontSize: 23, color: Colors.purple),
                              ),
                              //여백
                              Text(
                                '',
                                style: TextStyle(fontSize: 10),
                              ),
                              //(w/controller)
                              Text(
                                'D-20',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        //(w/Controller)
                        Text(
                          'OOO',
                          style: TextStyle(color: Colors.grey),
                        ),
                        //고정
                        Text('님의 커피 1잔 평균 금액은 ',
                            style: TextStyle(color: Colors.grey)),
                        //(w/Controller)
                        Text('5,000', style: TextStyle(color: Colors.grey)),
                        //고정
                        Text('원 입니다.', style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //> 절약금액 >Rabbit >달성율 >예상우대이율

            Container(
              // padding: EdgeInsets.only(left: 30),
              width: screenWidth * 0.95,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: //Detail 글자 부분
                        Text('Detail',
                            style: TextStyle(fontSize: 30, color: Colors.grey)),
                  ),
                  //>절약금액
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '',
                          style: TextStyle(fontSize: 8),
                        ),
                        Row(
                          children: [
                            Text('> 절약 금액',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.purple)),
                            Spacer(),
                            Text(
                              '(기준 : 무지출)',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            )
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 4),
                        ),
                        //절약금액 세부사항 (w/Controller)
                        Column(
                          children: [
                            Row(
                              children: [
                                //고정
                                Text('무지출 유적금 '),
                                //(w/Controller)
                                Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic),
                                ),
                                //고정
                                Text(' 일 :   '),
                                //(w/Controller)
                                Text('35,000원',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontStyle: FontStyle.italic))
                              ],
                            ),
                            Text(
                              '',
                              style: TextStyle(fontSize: 4),
                            ),
                            Row(
                              children: [
                                //고정
                                Text('무지출 무적금 '),
                                //(w/Controller)
                                Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic),
                                ),
                                //고정
                                Text(' 일 :   '),
                                //(w/Controller)
                                Text('15,000원',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontStyle: FontStyle.italic))
                              ],
                            ),
                          ],
                        ),
                        //절약금액 수정 사항(w/Controller)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //(w/Controller)
                            Text(
                              '총 50,000원',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 3),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '(추산치)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: blankHeight,
                  ),
                  //>적금 총액
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '',
                          style: TextStyle(fontSize: 8),
                        ),
                        Row(
                          children: [
                            Text('> 적금 총액',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.purple)),
                            Spacer(),
                            Text(
                              '(기준 : 유적금)',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 4),
                        ),
                        //적금총액 세부사항 (w/Controller)
                        Column(
                          children: [
                            Row(
                              children: [
                                //고정
                                Text('무지출 유적금 :  '),
                                //(w/Controller)
                                Text(
                                  '35,000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic),
                                ),
                                //고정
                                Text(' 원'),
                              ],
                            ),
                            Text(
                              '',
                              style: TextStyle(fontSize: 4),
                            ),
                            Row(
                              children: [
                                //고정
                                Text('유지출 유적금 :  '),
                                //(w/Controller)
                                Text(
                                  '40,000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic),
                                ),
                                //고정
                                Text(' 원'),
                                //(w/Controller)
                              ],
                            ),
                          ],
                        ),
                        //절약금액 수정 사항(w/Controller)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //(w/Controller)
                            Text(
                              '총 75,000원',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: blankHeight,
                  ),

                  //>챌린지 달성율
                  //Graph로 구현될 수 도 있습니다.
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '',
                          style: TextStyle(fontSize: 8),
                        ),
                        Row(
                          children: [
                            Text('>챌린지 달성율',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.purple)),
                            Spacer(),
                            Text(
                              '(기준 : 무지출 + 유지출무적금)',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          '',
                          style: TextStyle(fontSize: 4),
                        ),
                        //적금총액 세부사항 (w/Controller)
                        Column(
                          children: [
                            Row(
                              children: [
                                //고정
                                Text('무지출 :  '),
                                //(w/Controller)
                                Text(
                                  '100',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic),
                                ),
                                //고정
                                Text('%'),
                              ],
                            ),
                            Text(
                              '',
                              style: TextStyle(fontSize: 4),
                            ),
                            Row(
                              children: [
                                //고정
                                Text('유지출 유적금 :  '),
                                //(w/Controller)
                                Text(
                                  '100',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic),
                                ),
                                //고정
                                Text('%'),
                              ],
                            ),
                          ],
                        ),
                        //총 (w/Controller)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //고정
                            Text('총 ',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            //(w/Controller)
                            Text(
                              '100',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            //고정
                            Text('%',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: blankHeight,
                  ),

                  SizedBox(
                    height: blankHeight,
                  ),
                  //>예상 우대 이율
                  // --> 이걸 뺴고 달성율을 소비 적금 기준으로 나눠서 하기.(자세하게)
                  //아이콘을 넣는다거나 박스처리를 하거나 글자를 조금더 색깔 다르게 글자 크기 차이 주고
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
