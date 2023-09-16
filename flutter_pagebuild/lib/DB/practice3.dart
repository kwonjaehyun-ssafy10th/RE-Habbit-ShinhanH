// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'light_account.dart';
// import 'light_api.dart';

// class Account {
//   Account(this.bank, this.accNum);
//   Account.Savings(this.bank, this.accNum, this.maxAmount);
//   String bank;
//   String accNum;
//   int maxAmount = 0;

//   bool selected = false;
// }

// String process(str) {
//   return str["고객명"];
// }

// void main() async {
//   var account = await getAccountInfo('150422');
//   print(dataToAccount(account).bank);
//   // var account = getAccountInfo("150422").then((res) => {print(process(res))});
//   // getAccountListOf("최쏠").then((res) => print(res));
//   // // getAccountListOf("최쏠").then((res) => print(res[0]));
//   // Map<String, dynamic> account = {"asd": "asd"};
//   // getAccountListOf("최쏠")
//   //     .then((res) => {account = res[0][0], print(account.toString())});
//   // print(account.toString());
//   // getAccountListOf("최쏠").then((res) => print(res[0][0]["계좌번호"]));

//   // var list = await getAccountListOf("최쏠");

//   // print(list[0][0].runtimeType);
//   // initAccount(list[0][0]);
//   // var path = 'v$version/' + api3['account']['path'];
//   // final url = Uri.https(domain, 'v3' ".json");
//   // await http.patch(
//   //   url,
//   //   body: json.encode((await getAccountListOf("최쏠"))[0][0]),
//   // );
  // transfer("0731", "1503", "888888", "176662", 5000000, "급여", "급여", "급여이체");
  // getNameOf("888888").then((res) => print(res));
  // var mega = createAccountNo();
  // print(mega);
  // var ediya = createAccountNo();
  // print(ediya);
  // var twosome = createAccountNo();
  // print(twosome);
  // var yogiyo = createAccountNo();
  // print(yogiyo);
  // var coupangEats = createAccountNo();
  // print(coupangEats);
  // var kakaoTaxi = createAccountNo();
  // print(kakaoTaxi);
  // List list = [
  //   ["0807", "0854", "카카오택시", 8600],
  //   ["0807", "1250", "메가커피", 2500],
  //   ["0808", "1935", "요기요", 23000],
  //   ["0811", "0837", "이디야", 3900],
  //   ["0815", "1539", "무신사", 57000],
  //   ["0815", "1841", "UT택시", 7400],
  //   ["0815", "1916", "쿠팡이츠", 22000],
  //   ["0816", "0838", "투썸플레이스", 5900],
  //   ["0817", "0853", "카카오택시", 10500],
  //   ["0819", "1427", "카카오스타일", 68000],
  //   ["0822", "1245", "스타벅스", 6500],
  //   ["0823", "1846", "카카오택시", 9400],
  //   ["0829", "1239", "이디야", 4100]
  // ];
  // for (var item in list) {
  //   await transfer(item[0], item[1], "142490", nameToAccountNo[item[2]], item[3], item[2], "영업매출", "신한체크");
  // }
// }
