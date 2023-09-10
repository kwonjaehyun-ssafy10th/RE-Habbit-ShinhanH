import 'dart:ffi';

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

//원형 그래프

  void updateMainModel() {
// 여기서 모델 업데이트
  }

//성공률 리스트
  List<double> get sucRate {
    List<double> sucRatelist = [];
    sucRatelist.add(MainModel.inst.sucRate);
    sucRatelist.add(1 - MainModel.inst.sucRate);
    return sucRatelist;
  }

  int get sucRatePer {
    int rate = ((MainModel.inst.sucRate) * 100).toInt();
    return rate;
  }

//하단부 -  컨트롤러들
  void goToDetail() {
    Get.to(DetailView());
  }

  void goToRank() {
    Get.to(RankView());
  }

  void goToStamp() {
    Get.to(StampView());
  }
}
