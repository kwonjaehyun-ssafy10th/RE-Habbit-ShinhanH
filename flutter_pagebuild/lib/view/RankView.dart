// // ignore_for_file: prefer_const_constructors

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pagebuild/controller/RankController.dart';
// import 'package:get/get.dart';
// import 'package:flutter_pagebuild/controller/MainController.dart';
// // import 'package:sorted_list/sorted_list.dart';
// import 'package:categorized_dropdown/categorized_dropdown.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

//class RankView extends StatefulWidget {
//   const RankView({super.key});
//   @override
//   _RankViewState createState() => _RankViewState();
// }

// final controller = Get.find<RankController>();

// @override
// class _RankViewState extends State<RankView> {
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
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             //더보기버튼
//             Container(),

//             //평균 Rabbit Text
//             Container(
//               child: Column(
//                 children: const [Text('평균 Rabbit 지속 시간'), Text('상위% 기간')],
//               ),
//             ),
//             //평균 Rabbit Graph
//             //(w/Controller)
//             Container(child: RankGraph1()),
//             //Rabbit 모은 금액 Text
//             Container(
//               child: Column(
//                 children: const [Text('Rabbit으로 모은 금액'), Text('상위% 금액')],
//               ),
//             ),
//             //Rabbit 모은 금액 Graph
//             //(w/Controller)
//              Container(child: RankGraph2()),
//             ),
//             Container(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Get.find<RankController>().goToMain();
//                 },
//                 child: Text('goToMain'),
//               ),
//             )
//           ],
//         )),

//         // ElevatedButton(
//         //   onPressed: () {
//         //     Get.find<RankController>().goToMain();
//         //   },
//         //   child: Text('goToMain'),

//         // ),

//         bottomNavigationBar:
//             BottomNavigationBar(items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.share),
//             label: '친구에게 공유하기',
//           )
//         ]));
//   }

//   @override
//   //widget({required Container child}) {}
// }

// //더보기 버튼_provider
// //https://pub.dev/packages/dropdown_button2
// final List<String> items = [
//   '커피',
//   '여성',
//   '남성',
//   '10대',
//   '20대',
//   '30대',
//   '40대',
//   '50대 이상'
// ];
// List<String> selectedItems = [];

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2(
//           isExpanded: true,
//           hint: Align(
//             alignment: AlignmentDirectional.center,
//             child: Text(
//               '랭킹',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Theme.of(context).hintColor,
//               ),
//             ),
//           ),
//           items: items.map((item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               //disable default onTap to avoid closing menu when selecting an item
//               enabled: false,
//               child: StatefulBuilder(
//                 builder: (context, menuSetState) {
//                   final isSelected = selectedItems.contains(item);
//                   return InkWell(
//                     onTap: () {
//                       isSelected
//                           ? selectedItems.remove(item)
//                           : selectedItems.add(item);
//                       //This rebuilds the StatefulWidget to update the button's text
//                       setState(() {});
//                       //This rebuilds the dropdownMenu Widget to update the check mark
//                       menuSetState(() {});
//                     },
//                     child: Container(
//                       height: double.infinity,
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         children: [
//                           isSelected
//                               ? const Icon(Icons.check_box_outlined)
//                               : const Icon(Icons.check_box_outline_blank),
//                           const SizedBox(width: 16),
//                           Text(
//                             item,
//                             style: const TextStyle(
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           }).toList(),
//           //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
//           value: selectedItems.isEmpty ? null : selectedItems.last,
//           onChanged: (value) {},
//           selectedItemBuilder: (context) {
//             return items.map(
//               (item) {
//                 return Container(
//                   alignment: AlignmentDirectional.center,
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     selectedItems.join(', '),
//                     style: const TextStyle(
//                       fontSize: 14,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     maxLines: 1,
//                   ),
//                 );
//               },
//             ).toList();
//           },
//           buttonStyleData: const ButtonStyleData(
//             height: 40,
//             width: 140,
//           ),
//           menuItemStyleData: const MenuItemStyleData(
//             height: 40,
//             padding: EdgeInsets.zero,
//           ),
//         ),
//       ),
//     ),
//   );
// }

// void setState(Null Function() param0) {}

// //평균 Rabbit Graph
// class RankGraph1 extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   RankGraph1({Key? key}) : super(key: key);

//   @override
//   RankGraph1State createState() => RankGraph1State();
// }

// class RankGraph1State extends State<RankGraph1> {
//   late List<_ChartData> data;
//   late TooltipBehavior _tooltip;

//   @override
//   void initState() {
//     data = [
//       //Controller, Data 유기적으로 작동해야 할 부분
//       _ChartData('~5%🥕', 30),
//       //아래는 고정값
//       _ChartData('~10%', 15),
//       _ChartData('~20%', 12),
//       _ChartData('~40%', 6.4)
//     ];
//     _tooltip = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       primaryXAxis: CategoryAxis(),
//       primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
//       tooltipBehavior: _tooltip,
//       series: <ChartSeries<_ChartData, String>>[
//         BarSeries<_ChartData, String>(
//           dataSource: data,
//           xValueMapper: (_ChartData data, _) => data.x,
//           yValueMapper: (_ChartData data, _) => data.y,
//           name: 'Gold',
//           color: Color.fromRGBO(159, 205, 243, 1),
//         ),
//       ],
//     );
//   }
// }

// class _ChartData {
//   _ChartData(this.x, this.y);

//   final String x;
//   final double y;
// }

// //Rabbit 모은 금액 Graph
// class RankGraph2 extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   RankGraph2({Key? key}) : super(key: key);

//   @override
//   RankGraph1State createState() => RankGraph1State();
// }

// class RankGraph2State extends State<RankGraph1> {
//   late List<_ChartData> data;
//   late TooltipBehavior _tooltip;

//   @override
//   void initState() {
//     data = [
//       //고정값
//       _ChartData('~5%', 30),
//       //Controller, Data 유기적으로 작동해야 할 부분
//       _ChartData('~10%🥕', 15),
//       //고정값
//       _ChartData('~20%', 12),
//       _ChartData('~40%', 6.4)
//     ];
//     _tooltip = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       primaryXAxis: CategoryAxis(),
//       primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
//       tooltipBehavior: _tooltip,
//       series: <ChartSeries<_ChartData, String>>[
//         BarSeries<_ChartData, String>(
//           dataSource: data,
//           xValueMapper: (_ChartData data, _) => data.x,
//           yValueMapper: (_ChartData data, _) => data.y,
//           name: 'Gold',
//           color: Color.fromRGBO(159, 205, 243, 1),
//         ),
//       ],
//     );
//   }
// }

// //HeaderWidget
// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       'assets/images/logo-image.png',
//       height: 150,
//     );
//   }
//}
