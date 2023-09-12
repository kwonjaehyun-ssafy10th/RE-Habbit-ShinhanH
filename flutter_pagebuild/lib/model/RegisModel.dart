import 'dart:ffi';
import 'package:flutter_pagebuild/model/MainModel.dart';
import 'package:get/get.dart';

class RegisModel {
  //싱글턴 패턴 선언
  RegisModel.privateConstructor();
  static final RegisModel _inst = RegisModel.privateConstructor();
  static RegisModel get inst => _inst;

  String registName = '';
  String challengeName = '';

  int challenge = 0;
  int savingAmount = 0;

  List<Map<Map<String, String>, int>> accountList = [];
}
