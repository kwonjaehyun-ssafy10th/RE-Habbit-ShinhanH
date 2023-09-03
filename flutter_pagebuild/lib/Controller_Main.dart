import 'dart:ffi';
import 'package:get/get.dart';

//controller 변화 체크용 코드

class Controller_Main extends GetxController {
  RxString testS = 'test'.obs;

  void increment() {
    testS = 'good'.obs;
    update();
    // count(count.value + 1);
  }
}
