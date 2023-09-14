import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  Map<String, dynamic> api = {
    'account': {
      'path': 'v1/account',
      'dataBody': {"실명번호": "WmokLBDC09/yfin=="}
    },
    'transaction': {
      'path': 'v1/search/transaction',
      'dataBody': '''{
        "계좌번호": "110184999999"
        }'''
    },
    'balance': {
      'path': 'v1/account/balance/detail',
      'dataBody': '''{
        "출금계좌번호": "110184999999"
        }'''
    },
    'deposit': {
      'path': 'v1/account/deposit/detail',
      'dataBody': '''{
        "계좌번호":"230307000000"
      }'''
    },
    'transfer': {
      'path': 'v1/transfer/krw',
      'dataBody': {
        "출금계좌번호": "1102008999999",
        "입금은행코드": "088",
        "입금계좌번호": "110054999999",
        "이체금액": "30000",
        "입금계좌통장메모": "김신한",
        "출금계좌통장메모": "회비"
      }
    },
    'sol-push': {
      'path': 'v1/notice/sol-push',
      'dataBody': {"제휴고객번호": "233hWS3k", "발송메시지": "발송메세지 "}
    }
  };

  Future<http.Response> request(action) async {
    var path = api[action]['path'];
    var dataBody = api[action]['dataBody'];
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

  void postToFirebase(action) async {
    var path = api[action]['path'];
    var dataBody = api[action]['dataBody'];
    final url = Uri.https(
        'shb-hackton-ad177-default-rtdb.firebaseio.com', path + ".json");
    await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "dataHeader": {
          "successCode": "0",
          "resultCode": "",
          "resultMessage": ""
        },
        "dataBody": {
          "출금계좌번호": "1102008999999",
          "입금은행코드": "088",
          "입금계좌번호": "110054999999",
          "이체금액": "30000",
          "입금계좌통장메모": "김신한",
          "출금계좌통장메모": "회비",
          "거래후잔액": "3542000"
        }
      }),
    );
    return;
  }

  var response = await request("transfer");
  // print(response.body);

  // postToFirebase('transfer');

  Future<List> loadData(action) async {
    var path = api[action]['path'];
    final url = Uri.https(
        'shb-hackton-ad177-default-rtdb.firebaseio.com', path + ".json");
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<Object> loadedData = [];
    for (final item in listData.entries) {
      loadedData.add(item);
    }
    return loadedData;
  }

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

  var accountList = accountInfo();
  // print(accountList[0]);
  // print(accountInfo()[0]["김신한"]);
  List<dynamic> myList = await accountInfo();
  dynamic e1 = myList[0];
  print(e1["김신한"]);
}
