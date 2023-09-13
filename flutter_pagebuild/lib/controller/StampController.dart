import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/model/MainModel.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

import 'package:flutter_pagebuild/view/MainView.dart';

import 'package:flutter_pagebuild/view/StampView.dart';

class StampController extends GetxController {
  void goToMain() async {
    await Get.off(const MainView());
  }

  void showStamp() {
    Get.to(StampView());
  }
}
