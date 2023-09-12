// import 'package:flutter/material.dart';

// //아래 링크 빨간줄(버그) 떠서 우선 주석처리함
// //import 'package:flutter_pagebuild/view/flutter/dev/bots/utils.dart';

// import 'package:get/get.dart';
// import 'package:flutter_pagebuild/controller/DetailController.dart';

// class DetailView extends StatelessWidget {
//   DetailView({super.key});
//   final controller = Get.find<DetailController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const HeaderWidget(),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           toolbarHeight: 130,
//         ),
//         body: Container(
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//           //Widget _ ReHabbit 생성 날짜
//           widget(
//             child: Container(
//                 child: Row(children: [
//               Image.asset('assets/images/profile-img.png'),
//               const Text('Date of Birth',
//                   style: TextStyle(fontSize: 20, color: Colors.purple)),
//               //(w/Controller)
//               const Text('2023.03.22'),
//             ])),
//           ),

//           //Detail 글자 부분
//           const Text('Detail',
//               style: TextStyle(fontSize: 20, color: Colors.grey)),
//           //> 절약금액 >Rabbit >달성율 >예상우대이율

//           //Widget _ 소비&적금 유무에 따라 달라지는 것들
//           widget(
//             child: Container(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                   //>절약금액
//                   Container(
//                       child: const Column(children: [
//                     //글자
//                     Text('> 절약금액',
//                         style: TextStyle(fontSize: 20, color: Colors.purple)),

//                     Text('약 500,000원'),
//                     //글자
//                     Text('추산치')
//                   ])),

//                   //>Rabbit 적금 현황
//                   Container(
//                       child: const Column(children: [
//                     //글자
//                     Text('> Rabbit 적금 현황',
//                         style: TextStyle(fontSize: 20, color: Colors.purple)),
//                     //(w/Controller)
//                     Text('75,000원'),
//                     //(w/Controller)
//                     Text('적금 계좌로 이동')
//                   ])),

//                   //>달성율(성공+적금)
//                   Container(
//                       child: const Column(children: [
//                     //글자
//                     Text('> 달성율(성공+적금)',
//                         style: TextStyle(fontSize: 20, color: Colors.purple)),
//                     //(w/Controller)
//                     Text('100%'),
//                   ])),

//                   //>예상 우대 이율
//                   Container(
//                       child: const Column(children: [
//                     //글자
//                     Text('> 예상 우대이율',
//                         style: TextStyle(fontSize: 20, color: Colors.purple)),
//                     //(w/Controller)
//                     Text('연 4.5%')
//                   ]))
//                 ])),
//           )
//         ]

//                     // children: <Widget>[
//                     //   ElevatedButton(
//                     //     onPressed: () {
//                     //       Get.find<DetailController>().goToMain();
//                     //     },
//                     //     child: const Text('goToMain'),
//                     //   ),
//                     //   ElevatedButton(
//                     //       onPressed: () {
//                     //         //controller.work("test성공");
//                     //       },
//                     //       child: const Text('작동안함')),
//                     // ]),
//                     )),
//         bottomNavigationBar: BottomAppBar(
//             child: Row(children: [
//           ElevatedButton(
//             onPressed: () {
//               controller.goToMain();
//             },
//             child: const Text('goToMain'),
//           ),
//         ])));
//   }

//   widget({required Container child}) {}
// }

// // 헤더위젯
// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({super.key});

//   @override
//   Widget build(context) {
//     return Image.asset(
//       'assets/images/logo-image.png',
//       height: 150,
//     );
//   }
// }
