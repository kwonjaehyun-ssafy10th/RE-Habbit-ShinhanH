import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/view/MainView.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/model/RegisModel.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

class RegisController extends GetxController {
  //싱글톤 코드가 이것도 있대요....
  static final RegisController _inst = RegisController._internal();
  RegisController._internal();
  factory RegisController() {
    return _inst;
  }

//이름 받아오는 파트
  static TextEditingController inputName = TextEditingController();
  void setUser(String user) {
    //사용자 이름 받아오기 user  -> 사용자 이름임

    //해당하는 사용자 이름을 사용해 api에서 자료를 받아오는 함수 실행
  }

//함수 해야됨

//메인 화면 연결
  void goToMain() {
    Get.put(MainController());
    Get.find<MainController>().getController();
    Get.off(const MainView());
  }
}
