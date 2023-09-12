import 'dart:ffi';
import 'package:flutter_pagebuild/model/MainModel.dart';
import 'package:get/get.dart';

class RegisModel {
  //싱글턴
  RegisModel.privateConstructor();
  static final RegisModel _inst = RegisModel.privateConstructor();
  static RegisModel get inst => _inst;
}
