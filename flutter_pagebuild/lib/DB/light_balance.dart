import 'package:http/http.dart' as http;
import 'dart:convert';
import 'light_account.dart';
import 'light_api.dart';
import 'light_balance.dart';
import 'light_transaction.dart';
import 'light_transfer.dart';
import 'light_user.dart';
import 'shb_api.dart';

Map<String, dynamic> balanceToMap(int balance) {
  Map<String, dynamic> map = new Map();
  map['잔액'] = balance;
  return map;
}

void initBalance(String accountNo, int balance) {
  Map<String, dynamic> map = new Map();
  map['계좌번호'] = accountNo;
  map['잔액'] = balance;
  patchToFirebase('balance', map);
}

getBalanceOf(accountNo) {
  return getInfoValueOf(accountNo, 'balance');
}

patchBalance(accountNo, withdrawal, deposit) async {
  var balance = await getBalanceOf(accountNo);
  var newBalance = balance - withdrawal + deposit;
  Map<String, dynamic> map = new Map();
  map["잔액"] = newBalance;
  List paths = ['balance', 'account'];
  for (var path in paths) {
    final url = Uri.https(
        domain, 'v' + version + '/' + path + "/" + accountNo + ".json");
    await http.patch(
      url,
      body: json.encode(map),
    );
  }

  var path = 'v' + version + '/' + 'user';
  final url = Uri.https(domain, path + ".json");
  var response = await http.get(url);
  Map<String, dynamic> userData = json.decode(response.body);
  userData.forEach((username, user) {
    var pathUser = username;
    for (int i = 0; i < (user["계좌목록"]).length; i++) {
      if (user["계좌목록"][i]["계좌번호"] == accountNo) {
        final patchUrl = Uri.https(
            domain, path + "/" + pathUser + "/계좌목록/" + i.toString() + ".json");
        http.patch(
          patchUrl,
          body: json.encode(map),
        );
      }
    }
  });
}
