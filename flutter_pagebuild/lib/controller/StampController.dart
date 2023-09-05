import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/model/MainModel.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

import 'package:flutter_pagebuild/view/MainView.dart';

import 'package:flutter_pagebuild/view/StampView.dart';

class StampController extends GetxController {
  //클래스를 통일성 있게 관리해야 하는데 어려움
  var mainDB = MainModel("RegisControllerTest").obs;

  void work(String str) {
    mainDB.value.test = str;
    mainDB.refresh();
  }

  void goToMain() {
    Get.to(MainView());
  }

  void showStamp() {
    Get.to(StampView());
  }
}
