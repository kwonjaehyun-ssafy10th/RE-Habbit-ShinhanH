import 'package:http/http.dart' as http;
import 'dart:convert';
import 'light_account.dart';
import 'light_api.dart';
import 'light_balance.dart';
import 'light_transaction.dart';
import 'light_transfer.dart';
import 'light_user.dart';
import 'shb_api.dart';

Map<String, dynamic> accountToMap(String name, String accountNo, String type,
    String title, int balance, int transactionCnt) {
  Map<String, dynamic> map = {};
  map['고객명'] = name;
  map['계좌번호'] = accountNo;
  map['구분'] = type;
  map['상품명'] = title;
  map['잔액'] = balance;
  map['거래내역반복횟수'] = transactionCnt;
  return map;
}

void initAccount(Map account) {
  patchToFirebase('account', account);
  initBalance(account["계좌번호"], account["잔액"]);
  initTransactionList(account["계좌번호"]);
  patchUserByAccount(account);
}

// 계좌번호 입력하면 계좌 정보 반환
getAccountInfo(accountNo) async {
  var path = 'v$version/account';
  final url = Uri.https(domain, "${"$path/" + accountNo}.json");
  final response = await http.get(url);
  if (response != null) {
    var result = json.decode(response.body);
    return result;
  }
}

// 이름 입력하면 계좌 목록 반환
getAccountListOf(String name) async {
  var loadedData = await loadData('user');
  if (loadedData != null) {
    for (var item in loadedData) {
      if (item.key == name) {
        return (item.value["계좌목록"]);
      }
    }
  } else {
    print("존재하지 않는 사용자입니다.");
  }
}

// 이름 입력하면 입출금계좌 리스트 출력
getCheckingAccountListOf(String name) async {
  List<dynamic> list = [];
  var loadedData = await loadData('user');
  if ( loadedData != null) {
    for (var item in loadedData) {
      if (item.key == name) {
        for (var account in item.value["계좌목록"]) {
          if (account["구분"] == "입출금계좌") {
            list.add(account);
          }
        }
        return list;
      }
    }
  }
}

// 이름 입력하면 적금계좌 리스트 출력
getSavingAccountListOf(String name) async {
  List<dynamic> list = [];
  var loadedData = await loadData('user');
  if (loadedData != null) {
    for (var item in loadedData) {
      if (item.key == name) {
        for (var account in item.value["계좌목록"]) {
          if (account["구분"] == "자유적금") {
            list.add(account);
          }
        }
        return list;
      }
    }
  }
}

String createAccountNo() {
  return (random.nextInt(100000) + 100000).toString();
}

void main() {
  // var account = getAccountInfo("150422").then((res) => {print(res)});
  // print(account);
  // print(getAccountInfo("150422"));

  // var accountList = await getAccountListOf("쏠");
  // print(accountList);

  // var checkingAccount = await getCheckingAccountListOf("쏠");
  // print(checkingAccount);

  // var savingAccount = await getSavingAccountListOf("쏠");
  // print(savingAccount);
}
