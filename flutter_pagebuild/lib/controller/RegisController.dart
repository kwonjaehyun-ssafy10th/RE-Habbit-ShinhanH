import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/view/MainView.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/model/RegisModel.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

// 1. 계좌번호&이름 입력
// 2. 계좌번호를 통한 본인인증
// 3. 해당 사용자 확인 (페이지 추가 필요) - 데이터 불러오기
// 4. 지출 확인할 계좌
// 5. 소비 항목 (주요 키워드)
// --> 이 부분 정리해야 될 것 같음
// 6. 적금 계좌 연결

class RegisController extends GetxController {
  //싱글톤 코드가 이것도 있대요....
  static final RegisController _inst = RegisController._internal();
  RegisController._internal();
  factory RegisController() {
    return _inst;
  }

  RegisModel regisModel = RegisModel();
  CheckModel checkInfo = CheckModel();

//이름 받아오는 파트
  static TextEditingController inputName = TextEditingController();
  void setUser(String user, String bankname, String account) {
    //사용자 이름 받아오기 user  -> 사용자 이름임
    checkInfo.registName = user;
    checkInfo.checkBank = bankname;
    checkInfo.checkAccount = account;
  }

  String get getuserName {
    return checkInfo.checkAccount;
  }

//함수 해야됨

//메인 화면 연결
  void goToMain() {
    Get.put(MainController());
    Get.find<MainController>().getController();
    Get.off(const MainView());
  }
}
