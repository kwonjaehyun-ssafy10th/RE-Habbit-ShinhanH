import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/controller/RegisController.dart';
import 'package:flutter_pagebuild/view/DetailView.dart';
import 'package:flutter_pagebuild/view/MainView.dart';
import 'package:flutter_pagebuild/view/RankView.dart';
import 'package:flutter_pagebuild/view/StampView.dart';
import 'package:get/get.dart';

//Detail과 Stamp, Main 데이터는 하나 MainModel에 규합
import 'package:flutter_pagebuild/model/MainModel.dart';
import 'package:flutter_pagebuild/model/RankModel.dart';

import 'package:flutter_pagebuild/controller/DetailController.dart';
import 'package:flutter_pagebuild/controller/RankController.dart';
import 'package:flutter_pagebuild/controller/StampController.dart';

class resetMainModel with ChangeNotifier {
  //싱글턴
  static final resetMainModel _inst = resetMainModel._internal();
  resetMainModel._internal();
  factory resetMainModel() {
    return _inst;
  }

//MainController에서 바꿔야 할 내용
//1. 사용자 명
//2. 챌린지 명
//3. 그래프 % 실시간 계산

//사용자 정보 저장 -> 1회만 설정하기
  void setUser(String username, String challengeName, String chkAccount,
      String savings) {
    MainModel.inst.user.username = username;
    MainModel.inst.user.challengeName = challengeName;
    MainModel.inst.user.chkAccount = chkAccount;
    MainModel.inst.user.savings = savings;
  }

  User getUser() {
    return MainModel.inst.user;
  }

//원형 그래프

  void resetPieChartMap() {
//파이 차트에 필요한 내용만 업데이트
    MainModel.inst.PieChartMap['챌린지 성공'] = MainModel.inst.challengeSuc / 100;
    MainModel.inst.PieChartMap['적금 성공'] = MainModel.inst.savingSuc / 100;
    MainModel.inst.PieChartMap['실패'] = MainModel.inst.challengefail / 100;
//챌린지 달성률 업데이트
    MainModel.inst.sucRate =
        MainModel.inst.challengeSuc / MainModel.inst.dayCnt * 100;
    MainModel.inst.failRate =
        MainModel.inst.challengefail / MainModel.inst.dayCnt * 100;
    MainModel.inst.savinRate =
        MainModel.inst.savingSuc / MainModel.inst.dayCnt * 100;

//Listener
    notifyListeners();
  }
  //파이 차트에서 필요한 재료는?

//PieChartMap get
  Map<String, double> get getPieChartMap {
    //비어 있을 경우 -reset콜
    if (MainModel.inst.PieChartMap == null) {
      resetPieChartMap();
    } else if (true) {
      //변동 사항 있을 경우 -reset콜
      resetPieChartMap();
    }

    //변동 사항 없으면 그대로 반환
    return MainModel.inst.PieChartMap;
  }

//성공
  String get getSucSavRate {
    if (MainModel.inst.sucRate == -1) {
      resetPieChartMap();
    }
    //소수점 자리 수
    return MainModel.inst.sucRate.toStringAsFixed(1);
  }

  String get getSucRate {
    //소수점 자리 수
    return MainModel.inst.sucRate.toStringAsFixed(1);
  }

//실패
  String get getFailRate {
    //소수점 자리 수
    return MainModel.inst.failRate.toStringAsFixed(1);
  }

//적금으로 성공
  String get getsavinRate {
    //소수점 자리 수
    return MainModel.inst.savinRate.toStringAsFixed(1);
  }
}

class MainController extends GetxController {
  //reset 모델 - 싱글턴 생성자
  resetMainModel reset = resetMainModel();

  //하단부는 페이지 관리
  void getController() {
    Get.lazyPut<DetailController>(() => DetailController());
    Get.lazyPut<RankController>(() => RankController());
    Get.lazyPut<StampController>(() => StampController());
  }

//장면 보여주는 뷰
  void showMain() {
    Get.to(const MainView());
  }

//하단부 -  컨트롤러들
  void goToDetail() {
    //Get.to(DetailView());
  }

  void goToRank() {
    //Get.to(RankView());
  }

  void goToStamp() {
    Get.to(const StampView());
  }
}
