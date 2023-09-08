import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pagebuild/controller/RegisController.dart';
import 'package:fluttertoast/fluttertoast.dart';

final controller = Get.find<RegisController>();
class RegisView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
      );
    
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
    return Center(
      child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              SizedBox( 
                width: 200,
                height: 100,
                child: ElevatedButton(
                
                  onPressed: () {
                    Navigator.of(context).push( //push: 다음 화면을 쌓겠다는 의미
                      CustomRoute(
    
                        builder: (BuildContext context) => SecondScreen(), 
                        settings: RouteSettings(), //materialpageroute: navigator가 이동할 경로 지정
                      ),
                    );
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
          ),
    ); 
  }
}

// 두번째 페이지 - 이름 받기

class SecondScreen extends StatelessWidget {
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
              '당신의 이름은 무엇인가요?',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            
            TextFieldExample(),

            OutlinedButton(onPressed: (){
              // !!! 소비내역 조회하기 !!!
              // 조회 후 다음 단계로
              Navigator.of(context).push( //push: 다음 화면을 쌓겠다는 의미
                CustomRoute(
                  builder: (BuildContext context) => ThirdScreen(), 
                  settings: RouteSettings(), //materialpageroute: navigator가 이동할 경로 지정
                ),
              );
              
            }, child: Text('제출'))
          ],
       
        ),

      )
    );
  }
}

// 화면 전환 커스텀
class CustomRoute<T> extends MaterialPageRoute<T> {

  CustomRoute({ required WidgetBuilder builder, required RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (settings.name=='/' )
      return child;
    
    return SlideTransition(
        position: Tween<Offset>(
            begin: Offset(1,0),
            end: Offset.zero
        ).animate(animation), 
        child: child
    );
  }
}

// 텍스트(이름) 인풋 받기
class TextFieldExample extends StatefulWidget {
  const TextFieldExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  bool _nameInputIsValid = true;

  // Widget _buildNumberTextField() {
  Widget build(BuildContext context) {
  
    return SizedBox(
      width: 270,
      child: TextField(
        keyboardType: TextInputType.text,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          errorText: _nameInputIsValid ? null : '실명을 정확히 입력해주세요.',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        onChanged: (String val) {
          // 이름 받으려고 코드 남겨두긴 했는데, 변화할 때마다 받아와서 좀 수정이 필요할듯
          final v = val;
          debugPrint('value = $v');
          setState(() => _nameInputIsValid = true);
          
        },
      ),
    );
  }
}

// 세번째 페이지 - 챌린지 선택하기
// 커피 선택지만 남기고 비활성화 하는 건 나중에 해 볼 예정

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int _radioVal = 0;
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
              '참여할 챌린지를 선택하세요',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              children: [0, 1, 2, 3].map((int index) {
                return ListTile(
                  leading: Radio<int>(
                    value: index,
                    groupValue: _radioVal,
                    onChanged: (int? value) {
                      if (value != null) {
                        setState(() {
                          _radioVal = value;
                        });
                      }
                    },
                  ),
                  title: Text(
                    _getLabelText(index),
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
            ),
            OutlinedButton(
              onPressed: () {
                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => FourthScreen(),
                    settings: RouteSettings(),
                  ),
                );
              },
              child: Text('제출'),
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

// 네번째 페이지 - 참여일수 및 금액 받기

class FourthScreen extends StatelessWidget {
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
            // 선택지들
            PeriodDropdownButton(),
            AmountSlider(),
            OutlinedButton(
              onPressed: () {
                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => FifthScreen(),
                    settings: RouteSettings(),
                  ),
                );
              },
              child: Text('제출'),
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

  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
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
          title: const Text(
            '참여 일수 : ',
            
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          contentPadding: EdgeInsets.all(100),
          trailing: DropdownButton<String>(
            // Must be one of items.value.
            value: _btn1SelectedVal,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() => _btn1SelectedVal = newValue);
              }
            },
            items: this._dropDownMenuItems,
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
              fontSize: 28,
            ),),
        Slider(
          value: _sliderVal,
          max: 30000.0,
          divisions: 30,
          label: '${_sliderVal.round()}',
          onChanged: (double value) {
            setState(() => _sliderVal = value);
          },
        ),
      ],
    );
  }
}

// !!! 중간에 적금 계좌 선택하는 부분 빼먹음 !!!

// 다섯번째 화면 - 선택 결과 알려주는 창 
class FifthScreen extends StatelessWidget {
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
            // 선택지들
            Text(
              'Re-Habbit 명세서',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              '시계토끼 님\n커피 안 마시기\n30일\n10,000원\n신한 110xxx 적금통장',
              //'${userName} 님\n${challengeName}\n30일\n${amount}원\n${accountNum}',
              
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            OutlinedButton(
              onPressed: () {
                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => FinalScreen(),
                    settings: RouteSettings(),
                  ),
                );
              },
              child: Text(
                '이대로 생성하기',
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

// 마지막 화면 - 토끼 생성 + 메인으로 입장
class FinalScreen extends StatelessWidget {
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
            // 선택지들
            Text(
              'Re-Habbit 명세서',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              '시계토끼 님\n커피 안 마시기\n30일\n10,000원\n신한 110xxx 적금통장',
              //'${userName} 님\n${challengeName}\n30일\n${amount}원\n${accountNum}',
              
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            OutlinedButton(
              onPressed: () {
                // 다음 단계로
                Navigator.of(context).push(
                  CustomRoute(
                    builder: (BuildContext context) => FinalScreen(),
                    settings: RouteSettings(),
                  ),
                );
              },
              child: Text(
                '이대로 생성하기',
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