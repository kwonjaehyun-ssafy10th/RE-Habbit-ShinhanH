import 'package:get/get.dart';

//controller 변화 체크용 코드
class ControllerMain extends GetxController {
  final count = 0.obs;

  void increment() {
    count.value++;
    // count(count.value + 1);
  }
}
