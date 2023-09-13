import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/RegisController.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_pagebuild/view/MainView.dart';
import 'package:provider/provider.dart';

final controller = Get.find<RegisController>();

class RegisView extends StatelessWidget {
  const RegisView({super.key});
  @override
  Widget build(BuildContext context) {
    //초기값 설정용
    //controller.reset.resetPieChartMap();
    return MaterialApp(
      theme: ThemeData(
        fontFamily: '아리따-돋움',
      ),
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background-img.png'), // 배경 이미지
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const HeaderWidget(),
            centerTitle: true,
            backgroundColor: Colors.white,
            toolbarHeight: 130,
          ),
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // 페이지에 들어갈 위젯들
                  StartPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 헤더위젯
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(context) {
    //   double screenHeight = MediaQuery.of(context).size.height;
    //   double appbarHeight = screenHeight * 0.15;

    return Image.asset(
      'assets/images/logo-image.png',
      height: 100,
    );
  }
}

// 첫번째 페이지
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonHeight = screenHeight * 0.1;
    double imageHeight = screenHeight * 0.4;
    double startHeight = screenHeight * 0.15;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: startHeight,
          ),
          SizedBox(
            height: buttonHeight,
            width: 200,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.blue,
              highlightColor: const Color.fromARGB(255, 0, 72, 255),
              // 클릭시 색상 다르게 표현
              onPressed: () {
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => const SecondScreen(),
                    settings: const RouteSettings(),
                  ),
                );
              },

              child: const Text(
                'Re-Habbit\n생성하기',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: imageHeight,
            child: Image.asset(
              'assets/images/profile-img.png',
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

// 두번째 페이지 - 이름 받기 -> 계좌 받기로 수정(인증용)

//계좌 받기 위한 변수
TextEditingController _inputName = TextEditingController();
TextEditingController _inputAccount = TextEditingController();
TextEditingController _inputBank = TextEditingController();

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double appbarHeight = screenHeight * 0.15;
    double blankHeight = screenHeight * 0.03;

    return Scaffold(
        appBar: AppBar(
          title: const HeaderWidget(),
          centerTitle: true,
          backgroundColor: Colors.white,
          toolbarHeight: appbarHeight,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '이름을 입력해주세요',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: blankHeight,
                    ),
                    SizedBox(
                      width: screenWidth * 0.35,
                      child: TextField(
                          decoration: InputDecoration(
                            // labelText: '이름을 입력해주세요',
                            border: OutlineInputBorder(),
                          ),
                          controller: _inputName,
                          keyboardType: TextInputType.text),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: blankHeight,
              ),

              const Text(
                '사용하고 계신 계좌를 알려주세요.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: blankHeight,
              ),

              // 은행과 계좌 받기
              SizedBox(
                width: screenWidth * 0.8,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BankDropdownButton(),
                    AccountNum(),
                  ],
                ),
              ),

              SizedBox(
                height: blankHeight,
              ),
              OutlinedButton(
                  onPressed: () {
                    if (_inputAccount != 'null') {
                      controller.setUser(_inputAccount.text, 'et', 'et');
                    }

                    // 조회 후 다음 단계로
                    Navigator.of(context).push(
                      //push: 다음 화면을 쌓겠다는 의미
                      CustomRoute(
                        builder: (BuildContext context) => const AuthScreen(),
                        settings:
                            const RouteSettings(), //materialpageroute: navigator가 이동할 경로 지정
                      ),
                    );
                  },
                  child: const Text('제출'))
            ],
          ),
        ));
  }
}

// 화면 전환 커스텀
class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child;

    return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child);
  }
}

// 인풋 받기 : (수정) 이름 -> 계좌
class AccountNum extends StatefulWidget {
  const AccountNum({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountNumState();
}

class _AccountNumState extends State<AccountNum> {
  // Widget _buildNumberTextField() {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textWidth = screenWidth * 0.5;
    return SizedBox(
      width: textWidth,
      child: TextField(
        controller: _inputAccount,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

// 계좌 인증 페이지
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _radioVal = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double blankHeight = screenHeight * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '계좌로 1원을 전송하였습니다.\n\n인증문구를 입력해주세요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: blankHeight * 0.5,
            ),
            SizedBox(
              width: screenWidth * 0.5,
              child: TextField(
                  decoration: InputDecoration(
                    labelText: 'ex) 파란토끼',
                    border: OutlineInputBorder(),
                  ),
                  controller: _inputName,
                  keyboardType: TextInputType.text),
            ),
            SizedBox(
              height: blankHeight * 0.5,
            ),
            // 인풋값과 인증문구를 비교
            // 맞는 경우
            OutlinedButton(
              onPressed: () {
                // 성공 팝업
                showDialog(
                    context: context,
                    //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        //Dialog Main Title
                        title: Column(
                          children: <Widget>[
                            new Text("계좌 인증"),
                          ],
                        ),
                        //
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "인증에 성공하였습니다.",
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          new OutlinedButton(
                            child: new Text("확인"),
                            onPressed: () {
                              // 성공시 다음 페이지로
                              Navigator.of(context).push(
                                CustomRoute(
                                  builder: (BuildContext context) =>
                                      const AccSelectScreen(),
                                  settings: const RouteSettings(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    });
              },
              child: const Text('인증하기(성공)'),
            ),
            // 인증 실패한 경우
            OutlinedButton(
              onPressed: () {
                // 맞지 않는 경우
                // 실패 팝업
                showDialog(
                    context: context,
                    //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        //Dialog Main Title
                        title: Column(
                          children: <Widget>[
                            new Text("계좌 인증"),
                          ],
                        ),
                        //
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "인증코드가 일치하지 않습니다.",
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          new OutlinedButton(
                            child: new Text("뒤로"),
                            onPressed: () {
                              // 다시 인증문구 페이지로
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: const Text('인증하기(실패)'),
            )
          ],
        ),
      ),
    );
  }
}

// 챌린지 선택하기 페이지
class ChallSelectScreen extends StatefulWidget {
  const ChallSelectScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChallSelectScreenState();
}

class _ChallSelectScreenState extends State<ChallSelectScreen> {
  int _radioVal = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double blankHeight = screenHeight * 0.05;
    double itemWidth = screenWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '참여할 챌린지를 선택하세요',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: blankHeight,
            ),
            SizedBox(
              width: itemWidth,
              child: ListView(
                shrinkWrap: true,
                children: [0, 1, 2, 3].map((int index) {
                  bool isEnabled = true; // 기본적으로 모든 선택지를 활성화합니다.
                  if (index != 0) {
                    // '커피 안 마시기' 선택지가 아닌 경우에만 비활성화합니다.
                    isEnabled = false;
                  }

                  return ListTile(
                    leading: Radio<int>(
                      value: index,
                      groupValue: _radioVal,
                      onChanged: isEnabled
                          ? (int? value) {
                              if (value != null) {
                                setState(() {
                                  _radioVal = value;
                                });
                              }
                            }
                          : null, // isEnabled가 false인 경우, onChanged를 null로 설정하여 비활성화 상태로 만듭니다.
                    ),
                    title: Text(
                      _getLabelText(index),
                      style: TextStyle(
                        fontSize: 20,
                        color: isEnabled
                            ? Colors.black
                            : Colors.grey, // 비활성화된 경우 색상을 변경합니다.
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: blankHeight,
            ),
            OutlinedButton(
              onPressed: () {
                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => const trackAccScreen(),
                    settings: const RouteSettings(),
                  ),
                );
              },
              child: const Text('제출'),
            )
          ],
        ),
      ),
    );
  }
}

// 라디오 버튼에 대한 레이블을 반환하는 함수
String _getLabelText(int index) {
  switch (index) {
    case 0:
      return '커피 안 마시기';
    case 1:
      return '야식 안 먹기';
    case 2:
      return '택시 타지 않기';
    case 3:
      return '옷 사지 않기';
    default:
      return '';
  }
}

// 챌린지 참여일수 및 금액 받기

class AmountSelectScreen extends StatelessWidget {
  const AmountSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double blankHeight = screenHeight * 0.05;
    double startHeight = screenHeight * 0.2;

    double contentWidth = screenWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: startHeight,
            ),
            // 선택지들
            SizedBox(
                width: contentWidth,
                child: Column(
                  children: [
                    const PeriodDropdownButton(),
                    SizedBox(
                      height: blankHeight,
                    ),
                    const AmountSlider(),
                  ],
                )),

            SizedBox(
              height: blankHeight,
            ),
            OutlinedButton(
              onPressed: () {
                //계좌번호 받는 위치

                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => const ResultScreen(),
                    settings: const RouteSettings(),
                  ),
                );
              },
              child: const Text('제출'),
            )
          ],
        ),
      ),
    );
  }
}

// 드롭다운 1 - 기간 설정
class PeriodDropdownButton extends StatefulWidget {
  const PeriodDropdownButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PeriodDropdownButtonState();
}

class _PeriodDropdownButtonState extends State<PeriodDropdownButton> {
  static const menuItems = <String>[
    '30일',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = '30일';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          title: const Text(
            '참여 일수 : ',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          trailing: DropdownButton<String>(
            // Must be one of items.value.
            value: _btn1SelectedVal,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() => _btn1SelectedVal = newValue);
              }
            },
            items: _dropDownMenuItems,
          ),
        ),
      ],
    );
  }
}

// 슬라이더 - 금액 설정
class AmountSlider extends StatefulWidget {
  const AmountSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AmountSliderState();
}

class _AmountSliderState extends State<AmountSlider> {
  double _sliderVal = 10000.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          '실패시 적금할 금액 설정',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        Slider(
          value: _sliderVal,
          max: 30000.0,
          divisions: 30,

          label: '${_sliderVal.round()}',
          // 이것도 제출하면 state 바꾸도록하기
          // 설정한 금액도 띄워보자
          onChanged: (double value) {
            setState(() => _sliderVal = value);
          },
        ),
      ],
    );
  }
}

// 적금계좌 조회 및 선택
class AccSelectScreen extends StatelessWidget {
  const AccSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '시계토끼 님 환영합니다!\n',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Text(
              '연동할 적금 계좌 선택하기',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            // DataTableExample(),

            const AccountTable(),

            const SizedBox(
              height: 20,
            ),

            OutlinedButton(
              onPressed: () {
                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) =>
                        const ChallSelectScreen(),
                    settings: const RouteSettings(),
                  ),
                );
              },
              child: const Text(
                '연동하기',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 입출금 계좌 조회 및 선택
class trackAccScreen extends StatelessWidget {
  const trackAccScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '시계토끼 님 환영합니다!\n',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Text(
              '조회할 입출금계좌 선택하기',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            // DataTableExample(),

            const AccountTable2(),

            const SizedBox(
              height: 20,
            ),

            OutlinedButton(
              onPressed: () {
                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) =>
                        const AmountSelectScreen(),
                    settings: const RouteSettings(),
                  ),
                );
              },
              child: const Text(
                '연동하기',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 입출금 계좌 테이블 만들 소스들
// 적금계좌 클래스 선언
class Account2 {
  Account2(this.bank, this.accNum);
  final String bank;
  final int accNum;

  bool selected = false;
}

// 데이터 소스
final List<Account2> _accounts2 = <Account2>[
  Account2('신한은행', 1104742313),
  Account2('카카오뱅크', 7432343242),
  Account2('우리은행', 2623339834),
  Account2('새마을금고', 3058831284),
  Account2('농협은행', 3564775924),
];

// row 수 만큼 테이블 만들기
class AccountTable2 extends StatefulWidget {
  const AccountTable2({super.key});

  @override
  _AccountTableState2 createState() => _AccountTableState2();
}

class _AccountTableState2 extends State<AccountTable2> {
  int? selectedRow; // 선택된 로우의 인덱스를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            // ListView.builder를 사용하여 동적으로 아이템 생성
            ListView.builder(
              shrinkWrap: true,
              itemCount: _accounts.length,
              itemBuilder: (context, index) {
                final account = _accounts[index];
                return ListTile(
                  title: Text(account.bank),
                  // subtitle: Text('계좌번호: ${account.accNum}'),
                  trailing: Text('계좌번호: ${account.accNum}'),
                  tileColor: selectedRow == index
                      ? const Color.fromARGB(255, 150, 208, 255)
                      : null, // 선택된 로우에 색상 적용
                  onTap: () {
                    setState(() {
                      if (selectedRow == index) {
                        selectedRow = null; // 이미 선택된 로우를 다시 탭하면 선택 해제
                      } else {
                        selectedRow = index; // 새로운 로우를 선택
                      }
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 선택 결과 알려주는 창
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              '===============\n\n** RECEIPT **\n\n===============',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: const Text(
                '\n시계토끼님이 선택한 Re-Habbit이 맞나요?\n\n...........................................................',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Text(
              textAlign: TextAlign.center,
              '\n신한 620xxx 적금\n커피 안 마시기\n신한 110xxx 입출금\n30일\n10,000원\n\n...........................................................',
              //'${userName} 님\n${challengeName}\n30일\n${amount}원\n${accountNum}',

              style: TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            // 선택지 1 - 토끼 생성
            OutlinedButton(
              onPressed: () {
                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => const FinalScreen(),
                    settings: const RouteSettings(),
                  ),
                );
              },
              child: const Text(
                '이대로 생성하기',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            // 선택지 2 - 다시 설정하기
            TextButton(
              onPressed: () {
                // 적금 선택 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => const AccSelectScreen(),
                    settings: const RouteSettings(),
                  ),
                );
              },
              child: const Text(
                '수정하기',
                style: TextStyle(
                  color: Color.fromARGB(255, 112, 108, 108),
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 마지막 화면 - 토끼 생성 + 메인으로 입장
class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '첫 걸음을 내딛은 걸 축하합니다!',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/profile-img.png',
              height: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              '도전을 시작하세요',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Get.find<RegisController>().goToMain();
              },
              child: const Text(
                '메인으로 가기',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 적금계좌 클래스 선언
class Account {
  Account(this.bank, this.accNum, this.maxAmount);
  final String bank;
  final int accNum;
  final int maxAmount;

  bool selected = false;
}

// 데이터 소스
final List<Account> _accounts = <Account>[
  Account('신한은행', 1104742313, 300000),
  Account('카카오뱅크', 7432343242, 200000),
  Account('우리은행', 2623339834, 200000),
  Account('새마을금고', 3058831284, 300000),
  Account('농협은행', 3564775924, 300000),
];

// row 수 만큼 테이블 만들기
class AccountTable extends StatefulWidget {
  const AccountTable({super.key});

  @override
  _AccountTableState createState() => _AccountTableState();
}

class _AccountTableState extends State<AccountTable> {
  int? selectedRow; // 선택된 로우의 인덱스를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            // ListView.builder를 사용하여 동적으로 아이템 생성
            ListView.builder(
              shrinkWrap: true,
              itemCount: _accounts.length,
              itemBuilder: (context, index) {
                final account = _accounts[index];
                return ListTile(
                  title: Text(account.bank),
                  subtitle: Text('계좌번호: ${account.accNum}'),
                  trailing: Text('월 최대 납부액: ${account.maxAmount}'),
                  tileColor: selectedRow == index
                      ? const Color.fromARGB(255, 150, 208, 255)
                      : null, // 선택된 로우에 색상 적용
                  onTap: () {
                    setState(() {
                      if (selectedRow == index) {
                        selectedRow = null; // 이미 선택된 로우를 다시 탭하면 선택 해제
                      } else {
                        selectedRow = index; // 새로운 로우를 선택
                      }
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 추가 - 계좌번호 입력 시 은행 선택 과정에 필요한 클래스
// 은행 클래스 선언 -> 필드에 은행 이름과 은행 코드를 넣음
class Bank {
  Bank(this.bName, this.bCode);
  final String bName;
  final int bCode;

  // bool selected = false;
}

// 은행 데이터들
// 너무 많아서 일단 주석처리
final List<Bank> _banks = <Bank>[
  Bank('신한', 088),
  Bank('제주', 035),
  Bank('국민', 004),
  Bank('기업', 003),
  Bank('농협', 011),
  Bank('산업', 002),
  Bank('수협', 007),
  Bank('신협', 048),
  Bank('우리', 020),
  Bank('하나', 081),
  Bank('한국씨티', 027),
  Bank('카카오뱅크', 090),
  Bank('케이뱅크', 089),
  Bank('토스뱅크', 092),
  Bank('경남', 039),
  Bank('광주', 034),
  Bank('대구', 031),
  Bank('부산', 032),
  Bank('전북', 037),
  Bank('새마을', 045),
  Bank('우체국', 071),
  Bank('저축은행', 050),
  // Bank('지역농.축협', 012),
  // Bank('도이치', 055),
  // Bank('중국', 063),
  // Bank('중국건설', 067),
  // Bank('중국공상', 062),
  // Bank('BNP파리바', 061),
  // Bank('BOA', 060),
  // Bank('HSBC', 054),
  // Bank('JP모간', 057),
  // Bank('SC제일', 023),
  // Bank('산림조합', 064),
  // Bank('국세', 091),
  // Bank('신한금융투자', 278),
  // Bank('교보증권', 261),
  // Bank('다올투자증권', 227),
  // Bank('대신증권', 267),
  // Bank('메리츠증권', 287),
  // Bank('미래에셋증권', 238),
  // Bank('부국증권', 290),
  // Bank('삼성증권', 240),
  // Bank('상상인', 221),
  // Bank('신영증권', 291),
  // Bank('에스케이증권', 266),
  // Bank('유안타증권', 209),
  // Bank('유진투자증권', 280),
  // Bank('이베스트투자증권', 265),
  // Bank('카카오페이증권', 288),
  // Bank('케이프투자증권', 292),
  // Bank('키움증권', 264),
  // Bank('토스증권', 271),
  // Bank('한국포스증권', 294),
  // Bank('하나금융투자', 270),
  // Bank('하이투자증권', 262),
  // Bank('한국투자증권', 243),
  // Bank('한화투자증권', 269),
  // Bank('현대차증권', 263),
  // Bank('BNK투자증권', 224),
  // Bank('DB금융투자', 279),
  // Bank('IBK투자증권', 225),
  // Bank('KB증권', 218),
  // Bank('NH투자증권', 247),
  // Bank('지방세', 481),
  // Bank('국고금', 485),
  // Bank('금융결제원', 099)
];

class BankDropdownButton extends StatefulWidget {
  const BankDropdownButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BankDropdownButtonState();
}

class _BankDropdownButtonState extends State<BankDropdownButton> {
  static List<String> bankNames = _banks.map((bank) => bank.bName).toList();

  final List<DropdownMenuItem<String>> _dropDownMenuItems = bankNames
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  // final List<PopupMenuItem<String>> _popUpMenuItems = bankNames
  //     .map(
  //       (String value) => PopupMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       ),
  //     )
  //     .toList();

  String _btn1SelectedVal = '신한';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _btn1SelectedVal,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() => _btn1SelectedVal = newValue);
        }
      },
      items: _dropDownMenuItems,
    );
  }
}
