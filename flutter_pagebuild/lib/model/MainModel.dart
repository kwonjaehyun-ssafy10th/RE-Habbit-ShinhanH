import 'dart:ffi';

import 'package:get/get.dart';

class User {
  User.privateConstructor();
  static final User _instUser = User.privateConstructor();

  //사용자명
  String username = '';

  //챌린지명
  String challengeName = '';

  //챌린지 명 -> 챌린지에서 걸러낼 단어 목록
  //카페, 커피, 스타벅스...등
  //주기적으로 갱신 필요

  //계좌 정보 - 출금 & 적금
  String chkAccount = '1234';
  String savings = '1234';
}

class MainModel {
  //Model도 싱글턴으로 구현
  MainModel.privateConstructor();

  //MainModel.inst로 구현
  static final MainModel _inst = MainModel.privateConstructor();
  static MainModel get inst => _inst;
  //-- 여기가 싱글턴 패턴 구현 파트

//사용자 정보 객체
  User user = User._instUser;
  //데이터 종류

  //성공율

  //성공 판에서 성공여부 체크 하는 리스트

  //현재까지 진행된 스탬프 갯수
  int challenge = 30;

  int stampCnt = 0;

  // 0 - 커피x [성공]
  // 1 - 커피o / 적금 o [성공]
  // -1 - 커피o / 적금 x [실패]

  //case 종류
  // challengeSuc = 커피 x
  // savingSuc = 커피 o 적금 o
  // fail = 커피 o 적금 x
  // savingBonus = 커피 x 적금 o

  int challengeSuc = 15;
  int savingSuc = 10;
  int challengefail = 5;
  int savingBonus = 3;

//PieChart reset시 갱신해야하는 데이터들
  Map<String, double> PieChartMap = {};
  double sucRate = -1;
  double failRate = -1;
  double savinRate = -1;

  int dayCnt = 30;

  List<int> stampList = [];
}
