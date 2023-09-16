import 'dart:isolate';
import 'dart:async';

void myTask(SendPort sendPort) async {
  // 여기서 별도의 스레드에서 처리할 로직을 작성합니다.
  // 예를 들어, 10초 동안 대기한다고 가정하겠습니다.

  int counter = 0;
  Timer.periodic(const Duration(seconds: 1), (Timer t) {
    counter++;
    print('매 초마다 메시지가 출력됩니다. $counter');

    if (counter >= 50) {
      t.cancel(); // 5초 후에 타이머를 취소합니다.
    }
  });
}

void spawnNewIsolate() async {
  // 결과를 받기 위한 ReceivePort 생성
  ReceivePort receivePort = ReceivePort();

  print('myTask');
  // Isolate 생성
  await Isolate.spawn(myTask, receivePort.sendPort);

  // Isolate로부터 메시지 수신
  receivePort.listen((message) {
    print(message);
  });
}
