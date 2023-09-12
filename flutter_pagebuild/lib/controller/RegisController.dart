import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/view/MainView.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/model/RegisModel.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

class RegisController extends GetxController {
  RegisController.privateConstructor();
  //MainModel.inst로 구현
  static final RegisController _inst = RegisController.privateConstructor();
  static RegisController get inst => _inst;

//이름 받아오는 파트
  static TextEditingController inputName = TextEditingController();

  void setUser(String user) {
    //사용자 이름 받아오기
  }

//메인 화면 연결
  void goToMain() {
    Get.put(MainController());
    Get.find<MainController>().getController();
    Get.off(const MainView());
  }
}
