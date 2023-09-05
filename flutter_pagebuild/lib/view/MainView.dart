

class MainView extends StatefulWidget{

//MainView 

//StatefulWidget용 메서드
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>{

  //이부분이 갱신되는 뷰 - private 으로 지정
  Widget build(BuildContext context){
return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Text('현재 : MainView')
          ElevatedButton(
              child: Text('DetailView(개인)'),
              onPressed: () {
                Get.to(ScreenPage1());
              }),
          ElevatedButton(
              child: Text('StampView'),
              onPressed: () {
                Get.to(ScreenPage2());
              }),
          ElevatedButton(
              child: Text('RankView'),
              onPressed: () {
                Get.to(ScreenPage3());
              }),
        ]),
      ),
    );
  }
}