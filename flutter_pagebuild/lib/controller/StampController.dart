import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/model/MainModel.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

import 'package:flutter_pagebuild/view/MainView.dart';

import 'package:flutter_pagebuild/view/StampView.dart';


class resetMainModel with ChangeNotifier {
  //싱글턴
  static final resetMainModel _inst = resetMainModel._internal();
  resetMainModel._internal();
  factory resetMainModel() {
    return _inst;
  }

  void temptest() {
    MainModel.inst.challengeSuc = 0; // 당근 개수
    MainModel.inst.status = ''; // 챌린지 현황
    // MainModel.inst.challengefail = 0;
  }

  // 메서드들
  // MainModel 에 있는 변수 사용하기!!
  
  // 당근 수 가져오기
  int get getChallengeSuc {
    return MainModel.inst.challengeSuc;
  }

  // 스탬프 화면 위쪽에 현재 상태 문장으로 표현하는 부분
  // 변수 = status

  // 소비 x 인 경우
  // '\n🥕챌린지 현황🥕\n\n잘하고 있어요! 남은 오늘도 화이팅!\n',
  // 소비 o 인 경우
  // '\n🥕챌린지 현황🥕\n\n앗! 야생의 토끼가 나타났어요! \n당근을 지키러 가볼까요?\n',
  

  // check 리스트에 있는 값 받아서 도장으로 치환

  // 일단 일자마다 성공 or 실패 or 적금을 매핑해야 함(숫자로)
  void setStamp() {
    //스탬프 현황 업데이트
    MainModel.inst.check[1] = -1;

  }

  void resetStamp() {
    
    MainModel.inst.sucRate =
        MainModel.inst.challengeSuc / MainModel.inst.dayCnt * 100;
    MainModel.inst.failRate =
        MainModel.inst.challengefail / MainModel.inst.dayCnt * 100;
    MainModel.inst.savinRate =
        MainModel.inst.savingSuc / MainModel.inst.dayCnt * 100;
    //파이 차트에 필요한 내용만 업데이트
    MainModel.inst.PieChartMap['챌린지 성공'] = MainModel.inst.sucRate;
    MainModel.inst.PieChartMap['적금 성공'] = MainModel.inst.savinRate;
    MainModel.inst.PieChartMap['실패'] = MainModel.inst.failRate;

    //Listener
    // 위젯 업데이트해라

    notifyListeners();
  }

// check(성공 유무) get
  Map<int, int> get getCheck {
    //변동 사항 없으면 그대로 반환
    return MainModel.inst.check;
  }

}

class StampController extends GetxController {
  //reset 모델 - 싱글턴 생성자
  resetMainModel reset = resetMainModel();

  //하단부는 페이지 관리
  // void getController() {
  //   Get.lazyPut<DetailController>(() => DetailController());
  //   Get.lazyPut<RankController>(() => RankController());
  //   Get.lazyPut<StampController>(() => StampController());
  // }

//장면 보여주는 뷰

//하단부 - 컨트롤러들
  void goToMain() async {
    await Get.off(const MainView());
  }
}
// class StampController extends GetxController {
//   void goToMain() async {
//     await Get.off(const MainView());
//   }

//   void showStamp() {
//     Get.to(StampView());
//   }
// }