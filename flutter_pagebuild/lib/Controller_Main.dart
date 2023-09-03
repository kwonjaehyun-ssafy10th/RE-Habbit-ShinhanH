import 'dart:ffi';
import 'package:get/get.dart';

//controller 변화 체크용 코드
<<<<<<< Updated upstream
<<<<<<< Updated upstream
class ControllerMain extends GetxController {
  final count = 0.obs;
=======
class Controller_Main extends GetxController {
  RxString testS = 'test'.obs;
>>>>>>> Stashed changes
=======
class Controller_Main extends GetxController {
  RxString testS = 'test'.obs;
>>>>>>> Stashed changes

  void increment() {
    testS = 'good'.obs;
    update();
    // count(count.value + 1);
  }
}
