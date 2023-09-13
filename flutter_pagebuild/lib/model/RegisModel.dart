import 'dart:ffi';
import 'package:flutter_pagebuild/controller/RegisController.dart';
import 'package:flutter_pagebuild/model/MainModel.dart';
import 'package:get/get.dart';

class RegisModel {
  RegisModel.privateConstructor();

  //MainModel.inst로 구현
  static final RegisModel _inst = RegisModel.privateConstructor();
  static RegisModel get inst => _inst;

// 1. 계좌번호 입력
// 2. 계좌번호를 통한 본인인증
// 3. 해당 사용자 확인 (페이지 추가 필요) - 데이터 불러오기
// 4. 지출 확인할 계좌
// 5. 소비 항목 (주요 키워드)
// --> 이 부분 정리해야 될 것 같음
// 6. 적금 계좌 연결

  String registName = '';
  String challengeName = '';

  int challenge = 0;
  int savingAmount = 0;

  List<Map<Map<String, String>, int>> accountList = [];

  int temp() {
    return 0;
  }
}
