import 'package:http/http.dart' as http;
import 'dart:convert';
import 'light_account.dart';
import 'light_api.dart';
import 'light_balance.dart';
import 'light_transaction.dart';
import 'light_transfer.dart';
import 'light_user.dart';
import 'shb_api.dart';

Map<String, dynamic> transactionToMap(String date, String time, String type,
    int withdrawal, int deposit, String memo, String counterparty) {
  Map<String, dynamic> map = new Map();
  map['거래일자'] = date;
  map['거래시간'] = time;
  map['적요'] = type;
  map['출금금액'] = withdrawal;
  map['입금금액'] = deposit;
  map['내용'] = memo;
  map['거래처'] = counterparty;
  return map;
}

void initTransaction(String accountNo, Map transaction) async {
  patchToFirebase('transaction', transaction);
}

void initTransactionList(String accountNo) async {
  Map<String, dynamic> map = new Map();
  map["계좌번호"] = accountNo;
  map["거래내역반복횟수"] = 0;
  map["거래내역"] = null;
  Map<String, dynamic> temp = new Map();
  temp[accountNo] = map;
  var path = 'v' + version + '/' + 'transaction';
  final url = Uri.https(domain, path + ".json");
  await http.patch(
    url,
    body: json.encode(temp),
  );
}

void patchTransaction(String accountNo, String date, String time, String type,
    int withdrawal, int deposit, String memo, String counterparty) async {
  var path = 'v' + version + '/' + 'transaction';
  final url = Uri.https(domain, path + "/" + accountNo + "/거래내역" + ".json");
  Map<String, dynamic> temp = new Map();
  var cnt = await getTransactionCnt(accountNo);
  temp[cnt.toString()] = transactionToMap(
      date, time, type, withdrawal, deposit, memo, counterparty);
  var balance = await getBalanceOf(accountNo);
  temp[cnt.toString()]["잔액"] = balance - withdrawal + deposit;
  await http.patch(
    url,
    body: json.encode(temp),
  );
  patchTransactionCnt(accountNo);
  patchBalance(accountNo, withdrawal, deposit);
}

getTransactionCnt(accountNo) async {
  var accountInfo = await getAccountInfo(accountNo);
  return accountInfo["거래내역반복횟수"];
}

patchTransactionCnt(accountNo) async {
  var transactionCnt = await getTransactionCnt(accountNo);
  Map<String, dynamic> map = new Map();
  map["거래내역반복횟수"] = transactionCnt + 1;

  List paths = ['transaction', 'account'];
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

void main() {}
