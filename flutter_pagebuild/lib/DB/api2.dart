import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';
import 'account.dart';
import 'transfer.dart';
import 'solAppPush.dart';
import 'transaction.dart';
import 'notification.dart';
export 'api2.dart';

int time = 0;
String date = "09${((time / 10).toInt() + 1).toString().padLeft(2, '0')}";

Map<String, dynamic> api2 = {
  'account': {
    'path': 'v2/account',
  },
  'transaction': {
    'path': 'v2/transaction',
  },
  'balance': {
    'path': 'v2/balance',
  },
  'user': {
    'path': 'v2/user',
  }
};

Map<String, dynamic> keyMap = {
  'user': '고객명',
  'account': '계좌번호',
  'balance': '계좌번호',
  'transaction': '계좌번호',
  'notificatoin': '고객명'
};

Future<List> loadData(action) async {
  var path = api2[action]['path'];
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

void patchToFirebase(action, map) async {
  var path = api2[action]['path'];
  var keyName = keyMap[action];
  final url = Uri.https(
      'shb-hackton-ad177-default-rtdb.firebaseio.com', path + ".json");
  Map<String, dynamic> temp = new Map();
  temp[map[keyName]] = map;
  await http.patch(
    url,
    body: json.encode(temp),
  );
}

void patchUser(User user) {
  patchToFirebase('user', user.toMap());
  for (var account in user.accountList) {
    patchAccount(account);
    patchBalance(account);
  }
}

void patchAccount(Account account) {
  patchToFirebase('account', account.toMap());
}

void patchBalance(Account account) {
  Map<String, dynamic> map = new Map();
  map['계좌번호'] = account.accountNo;
  map['잔액'] = account.balance;
  patchToFirebase('balance', map);
}
