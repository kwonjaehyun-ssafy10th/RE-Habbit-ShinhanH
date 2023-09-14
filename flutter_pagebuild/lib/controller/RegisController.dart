import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/view/MainView.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/model/RegisModel.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

import 'package:flutter_pagebuild/DB/RegisApi.dart';

import 'package:flutter_pagebuild/DB/light_account.dart';

// 1. 계좌번호&이름 입력
// 2. 계좌번호를 통한 본인인증
// 3. 해당 사용자 확인 (페이지 추가 필요) - 데이터 불러오기
// 4. 지출 확인할 계좌
// 5. 소비 항목 (주요 키워드)
// --> 이 부분 정리해야 될 것 같음
// 6. 적금 계좌 연결

//계좌 인스턴스 생성
class Account {
  Account(this.accName, this.accNum);
  String accName;
  String accNum;

  bool selected = false;
}

//계좌 리스트 관리 클래스
class AccountList with ChangeNotifier {
  static final AccountList _inst = AccountList._internal();
  AccountList._internal();
  factory AccountList() {
    return _inst;
  }

//RegisModel - 싱글턴
  RegisModel regisModel = RegisModel();

//입출금 계좌 리스트(임시) - 삭제
  // List<Account> temp2 = <Account>[
  //   Account.Savings('신한은행', '1104742313', 300000),
  //   Account('카카오뱅크', 7432343242, 200000),
  //   Account('우리은행', 2623339834, 200000),
  //   Account('새마을금고', 3058831284, 300000),
  //   Account('농협은행', 3564775924, 300000),
  // ];

  int listlength = 0;

  Future<void> setAccountList() async {
    List<dynamic> tmplist = await getAccountListOf('최쏠'); //Map을 담은 리스트

    int idx = 0;
    regisModel.accountList.clear();
    while (regisModel.accountList.length < tmplist.length) {
      regisModel.accountList.add(dataToAccount(tmplist[idx++], true));
    }
    listlength = idx;
    //notifyListeners();
  }

  Future<List<Account>> get getAccountList async {
    await setAccountList();
    return regisModel.accountList;
  }

//사용자가 고른 계좌 정보 등록
  void setaccountConsum(int? selecRow) async {
    if (selecRow == null) return;
    regisModel.accountConsum = regisModel.accountList[selecRow];
  }

  void setaccountSaving(int? selecRow) async {
    if (selecRow == null) return;
    regisModel.accountSaving = regisModel.accountList[selecRow];
  }

  Account? get getaccountConsum {
    return regisModel.accountConsum;
  }

  Account? get getaccountSaving {
    return regisModel.accountSaving;
  }
}

class pickChallenge {
  // 챌린지 고르는 클래스
  static final pickChallenge _inst = pickChallenge._internal();
  pickChallenge._internal();
  factory pickChallenge() {
    return _inst;
  }

  RegisModel regisModel = RegisModel();

  //1.여태까지의 소비내역 반환
  void setconsumList() {
    //소비내역을 걸러내는 로직
    regisModel.consumList.add('스타벅스');
    regisModel.consumList.add('배민');
    regisModel.consumList.add('택시');
    regisModel.consumList.add('무신사');
    regisModel.consumList;
  }

  Future<List> get getconsumList async {
    //소비내역 반환
    return regisModel.consumList;
  }

  List get getconsumLabel {
    return regisModel.consumLabel;
  }
}

class RegisController extends GetxController {
  //싱글톤 코드가 이것도 있대요....
  static final RegisController _inst = RegisController._internal();
  RegisController._internal();
  factory RegisController() {
    return _inst;
  }

//자료 Model 인스턴스 받아오기
  RegisModel regisModel = RegisModel();

//CheckModel -> 본인 인증 모델
  CheckModel checkInfo = CheckModel();

//MainController불러오기
  resetMainModel resetMainM = resetMainModel();

//이름 받아오는 파트
  static TextEditingController inputName = TextEditingController();
  bool setUser(String user, String bankname, String account) {
    if (user == '' || account == '') {
      return false;
    }
    //사용자 이름 받아오기 user  -> 사용자 이름임
    checkInfo.registName = user;
    checkInfo.checkBank = bankname;
    checkInfo.checkAccount = account;

    return true;
  }

  bool verif(String str) {
    //본인인증 정답
    String rightVeri = '0000';

    if (str != rightVeri) return false;

    return true;
  }

//사용자 계좌 연결

//소비내역을 받아오기

//메인 화면 연결
  void goToMain() {
    Get.put(MainController());
    //getController 필요할 때 만들 클래스들 저장
    Get.find<MainController>().getController();
    Get.offAll(() => const MainView());
  }
}
