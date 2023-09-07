import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/RegisController.dart';

class RegisView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisController>();

    return Scaffold(
        appBar: AppBar(
              title: const HeaderWidget(),
              centerTitle: true,
              backgroundColor: Colors.white,
              toolbarHeight: 130,
            ),
        body: const Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            // 페이지에 들어갈 위젯들
            
            StartPage(),


            // ElevatedButton(
            //   onPressed: () {
            //     controller.goToMain();
            //   },
            //   child: Text('goToMain'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     controller.work("test성공");
            //   },
            //   child: Obx(
            //     () => Text('${controller.regis.value.test}'),
            //   ),
            // ),
          ]),
    ));
  }
}

// 헤더위젯
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(context) {
    return Image.asset(
      'assets/images/logo-image.png',
      height: 150,);
  }
}

// 첫번째 페이지
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/profile-img.png',
              height: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox( 
              width: 200,
              height: 100,
              child: ElevatedButton(
              
                onPressed: () {
                  // 뒤 페이지로 전환
                  Get.to(InsertNamePage());
                },
                child: const Text(
                  'Re-Habbit\n생성하기',
                  style: TextStyle(
                    fontSize: 30
                  ),
                  
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ); 
  }
}

// 이름 입력 페이지
class InsertNamePage extends StatelessWidget {
  const InsertNamePage({super.key});

  @override
  Widget build(context) {
    return const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '실명을 입력하세요.',
            ),
            TextField(
              decoration: InputDecoration(
              labelText: 'Input',
              ),
            ),
          ],
        ); 
  }
}