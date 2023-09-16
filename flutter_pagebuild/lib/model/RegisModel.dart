import 'dart:ffi';
import 'package:flutter_pagebuild/controller/RegisController.dart';
import 'package:flutter_pagebuild/model/MainModel.dart';
import 'package:get/get.dart';

class CheckModel {
  static final CheckModel _inst = CheckModel._internal();
  CheckModel._internal();
  factory CheckModel() {
    return _inst;
  }

  String registName = '';
  String checkBank = '';
  String checkAccount = '';
}

class RegisModel {
  static final RegisModel _inst = RegisModel._internal();
  RegisModel._internal();
  factory RegisModel() {
    return _inst;
  }

  String? userName;
  String? challengeName;

  List<Account> accountList = [];

  List consumLabel = ['커피 안 마시기', '배달 음식 안 먹기', '택시 안 타기', '옷 사지 않기'];
  List consumList = ['스타벅스', '배x의민족', '택시결제', '스타일지그'];

  Account? accountConsum;
  Account? accountSaving;

  int challenge = 0;
  int savingAmount = 0;
}
