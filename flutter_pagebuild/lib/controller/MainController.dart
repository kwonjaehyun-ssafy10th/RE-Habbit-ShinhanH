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
  resetMainModel.privateConstructor();
  static final resetMainModel _inst = resetMainModel.privateConstructor();
  static resetMainModel get inst => _inst;

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

  void updateMainModel() {}

  void setPieChartMap() {}

//성공률 리스트
  Map<String, double> get sucRate {
    List<double> sucRatelist = [];
    Map<String, double> testMap = {
      'suc': 60.0,
      'fail': (100.0 - 60.0),
      'savings': (10.0),
    };

    return testMap;
  }

  int get sucRatePer {
    int rate = ((MainModel.inst.sucRate) * 100).toInt();
    return rate;
  }
}

class MainController extends GetxController {
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
    Get.to(const DetailView());
  }

  void goToRank() {
    Get.to(const RankView());
  }

  void goToStamp() {
    Get.to(const StampView());
  }
}
