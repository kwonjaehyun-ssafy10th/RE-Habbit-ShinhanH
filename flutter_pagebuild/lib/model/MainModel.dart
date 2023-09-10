import 'package:get/get.dart';

class MainModel {
  //Model도 싱글턴으로 구현
  MainModel.privateConstructor();

  //MainModel.inst로 구현
  static final MainModel _inst = MainModel.privateConstructor();
  static MainModel get inst => _inst;
  //-- 여기가 싱글턴 패턴 구현 파트

  String test = "";

  // String detailTest = "detailTest";
  // String rankTest = "rankTest";
  // String stampTest = "stampTest";

  //데이터 종류

  //성공율

  //성공 판에서 성공여부 체크 하는 리스트

  //현재까지 진행된 스탬프 갯수
  int challenge = 30;

  int stampCnt = 0;

  // 0 - 커피x [성공]
  // 1 - 커피o / 적금 o [성공]
  // -1 - 커피o / 적금 x [실패]
  List<int> stampList = [];
  double sucRate = 0.7;
}
