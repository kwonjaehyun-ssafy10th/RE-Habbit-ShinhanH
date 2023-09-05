import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_pagebuild/view/MainView.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/model/RegisModel.dart';
import 'package:flutter_pagebuild/controller/MainController.dart';

class RegisController extends GetxController {
  var regis = RegisModel("RegisControllerTest").obs;

  void work(String str) {
    regis.value.test = str;
    regis.refresh();
  }

  void goToMain() {
    Get.put(MainController());
    Get.find<MainController>().getController();
    Get.off(MainView());
  }
}
