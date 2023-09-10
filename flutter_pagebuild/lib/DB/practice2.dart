import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api2.dart';
import 'user.dart';
import 'account.dart';
import 'transfer.dart';
import 'solAppPush.dart';
import 'transaction.dart';
import 'notification.dart';
export 'practice2.dart';

int userCnt = 0;

void main() async {

  Future<http.Response> request(action) async {
    var path = api2[action]['path'];
    var dataBody = api2[action]['dataBody'];
    final url = Uri.https('shbhack.shinhan.com', path);
    final response = await http.post(
      url,
      headers: {},
      body: json.encode({
        "dataHeader": {"apikey": "2023_Shinhan_SSAFY_Hackathon"},
        "dataBody": {
          "출금계좌번호": "1102008999999",
          "입금은행코드": "088",
          "입금계좌번호": "110054999999",
          "이체금액": "30000",
          "입금계좌통장메모": "김신한",
          "출금계좌통장메모": "회비"
        }
      }),
    );
    return response;
  }

  // var response = await request("transfer");


  Future<void> printData(action) async {
    List<dynamic> list = await loadData(action);
    print(action);
    for (var item in list) {
      // for (var item in items) {
      // for (var i in item.value["dataBody"]["거래내역"]) {
      //   print(i);
      // }
      print(item.value);

      // }
    }
  }

  // print(loadData('balance'));
  // print(loadData('balance'));
  // printData('account');

  // Future<void> accountInfo() async {
  //   List<dynamic> list = await loadData('account');
  //   final List<dynamic> userName = [];
  //   for (var item in list) {
  //     if (item.key[0] == '-') {
  //       userName.add(item.value["dataBody"]["고객명"]);
  //     }
  //   }
  //   print(userName);
  // }

  // Future<void> accountInfoOf(name) async {
  //   List<dynamic> list = await loadData('account');
  //   final List<dynamic> userName = [];
  //   final List<dynamic> userAccount = [];
  //   for (var item in list) {
  //     if (item.key[0] == '-') {
  //       userName.add(item.value["dataBody"]["고객명"]);
  //     }
  //     for (var name in userName) {

  //     }
  //   }
  // }

  Future<List> accountInfo() async {
    List<dynamic> list = await loadData('account');
    final List<dynamic> accounts = [];
    for (var item in list) {
      if (item.key[0] == '-') {
        final Map<String, dynamic> accountOf = new Map();
        accountOf[item.value["dataBody"]["고객명"]] =
            item.value["dataBody"]["조회내역1"];
        accounts.add(accountOf);
      }
    }
    // print(accounts);
    return accounts;
  }


  // void putToFirebase(action, map) async {
  // var path = api2[action]['path'];
  // final url = Uri.https('shb-hackton-ad177-default-rtdb.firebaseio.com', path + ".json");
  // print(map);
  // var keyName = 
  // await http.put(
  //   url,
  //   body: json.encode(map)
  //     );
  // // return;
  // }

  // printData('account');

  User user2 = new User("이몰리");
  patchToFirebase('user', user2.toMap());

  Account a1 = new Account("박플리", "102030", "입출금계좌", "쏠편한입출금통장", 0);
  patchToFirebase('account', a1.toMap());
}