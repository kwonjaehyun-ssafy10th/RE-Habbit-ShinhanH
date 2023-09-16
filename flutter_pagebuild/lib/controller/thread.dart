import 'dart:isolate';

void myTask(SendPort sendPort) {
  // 여기서 별도의 스레드에서 처리할 로직을 작성합니다.
  // 예를 들어, 10초 동안 대기한다고 가정하겠습니다.
  int cnt = 0;
  while (cnt < 5) {
    Future.delayed(Duration(seconds: 10), () {
      cnt++;
      //sendPort.send("작업이 완료되었습니다.");
      print('thread test');
    });
  }
}

void spawnNewIsolate() async {
  // 결과를 받기 위한 ReceivePort 생성
  ReceivePort receivePort = ReceivePort();

  print('test');
  // Isolate 생성
  await Isolate.spawn(myTask, receivePort.sendPort);

  // Isolate로부터 메시지 수신
  receivePort.listen((message) {
    print(message);
  });
}
