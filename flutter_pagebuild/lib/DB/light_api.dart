import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

Random random = Random();
String domain = 'shb-hackton-ad177-default-rtdb.firebaseio.com';

Map<String, dynamic> api3 = {
  'account': {
    'path': 'v3/account',
  },
  'transaction': {
    'path': 'v3/transaction',
  },
  'balance': {
    'path': 'v3/balance',
  },
  'user': {
    'path': 'v3/user',
  }
};

Map<String, dynamic> keyMap3 = {
  'user': '고객명',
  'account': '계좌번호',
  'balance': '계좌번호',
  'transaction': '계좌번호',
  'notificatoin': '고객명'
};

void patchToFirebase(action, map) async {
  var path = api3[action]['path'];
  var keyName = keyMap3[action];
  final url = Uri.https(domain, path + ".json");
  Map<String, dynamic> temp = {};
  temp[map[keyName]] = map;
  await http.patch(
    url,
    body: json.encode(temp),
  );
}

Map<String, dynamic> userToMap(String name) {
  Map<String, dynamic> map = {};
  map['고객명'] = name;
  Map<String, dynamic> temp = {};
  temp['0'] = accountToMap(name, (random.nextInt(100000) + 100000).toString(),
      "입출금계좌", "쏠편한입출금통장", 100000, 0);
  temp['1'] = accountToMap(name, (random.nextInt(100000) + 100000).toString(),
      "자유적금", "쏠편한작심3일적금", 0, 0);
  map['계좌목록'] = temp;
  return map;
}

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

Map<String, dynamic> balanceToMap(int balance) {
  Map<String, dynamic> map = {};
  map['잔액'] = balance;
  return map;
}

Map<String, dynamic> transactionToMap(String date, int time, String type,
    int withdrawal, int deposit, String memo, String counterparty) {
  Map<String, dynamic> map = {};
  map['거래일자'] = date;
  map['거래시간'] = time;
  map['적요'] = type;
  map['출금금액'] = withdrawal;
  map['입금금액'] = deposit;
  map['내용'] = memo;
  map['거래처'] = counterparty;
  return map;
}

void initUser(String user) {
  var userMap = userToMap(user);
  patchToFirebase('user', userMap);
  for (var item in userMap['계좌목록'].entries) {
    initAccount(item.value);
  }
}

void initAccount(Map account) {
  patchToFirebase('account', account);
  initBalance(account["계좌번호"], account["잔액"]);
  initTransactionList(account["계좌번호"]);
}

void initBalance(String accountNo, int balance) {
  Map<String, dynamic> map = {};
  map['계좌번호'] = accountNo;
  map['잔액'] = balance;
  patchToFirebase('balance', map);
}

void initTransaction(String accountNo, Map transaction) async {
  patchToFirebase('transaction', transaction);
}

void initTransactionList(String accountNo) async {
  Map<String, dynamic> map = {};
  map["계좌번호"] = accountNo;
  map["거래내역반복횟수"] = 0;
  map["거래내역"] = null;
  Map<String, dynamic> temp = {};
  temp[accountNo] = map;
  var path = 'v3/transaction';
  final url = Uri.https(domain, "$path.json");
  await http.patch(
    url,
    body: json.encode(temp),
  );
}

void patchTransaction(String accountNo, String date, int time, String type,
    int withdrawal, int deposit, String memo, String counterparty) async {
  var path = 'v3/transaction';
  final url = Uri.https(domain, "$path/$accountNo/거래내역.json");
  Map<String, dynamic> temp = {};
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

Future<List> loadData(action) async {
  var path = api3[action]['path'];
  final url = Uri.https(domain, path + ".json");
  final response = await http.get(url);
  final Map<String, dynamic> listData = json.decode(response.body);
  final List<Object> loadedData = [];
  for (final item in listData.entries) {
    loadedData.add(item);
  }
  return loadedData;
}

getAccountListOf(String? name) async {
  List list = [];
  var loadedData = await loadData('user');
  for (var item in loadedData) {
    if (item.key == name) {
      list.add(item.value);
    }
  }
  return list;
}

// 이름 입력하면 입출금계좌 리스트 출력
getCheckingAccountListOf(String name) async {
  var loadedData = await loadData('user');
  for (var item in loadedData) {
    if (item.key == name) {
      for (var account in item.value["계좌목록"]) {
        if (account["구분"] == "입출금계좌") {
          print(account);
        }
      }
    }
  }
}

// 이름 입력하면 적금계좌 리스트 출력
getSavingAccountListOf(String name) async {
  var loadedData = await loadData('user');
  for (var item in loadedData) {
    if (item.key == name) {
      for (var account in item.value["계좌목록"]) {
        if (account["구분"] == "자유적금") {
          print(account);
        }
      }
    }
  }
}

getBalanceOf(accountNo) async {
  var accountList = await loadData('balance');
  for (var item in accountList) {
    if (item.key == accountNo) {
      return item.value["잔액"];
    }
  }
}

patchBalance(accountNo, withdrawal, deposit) async {
  var path = 'v3/balance';
  final url = Uri.https(domain, "${"$path/" + accountNo}.json");
  var balance = await getBalanceOf(accountNo);
  Map<String, dynamic> map = {};
  map["잔액"] = balance - withdrawal + deposit;
  await http.patch(
    url,
    body: json.encode(map),
  );
}

getTransactionCnt(accountNo) async {
  var accountInfo = await getAccountInfo(accountNo);
  return accountInfo["거래내역반복횟수"];
}

patchTransactionCnt(accountNo) async {
  var transactionCnt = await getTransactionCnt(accountNo);
  List paths = ['v3/transaction', 'v3/account'];
  for (var path in paths) {
    final url = Uri.https(domain, path + "/" + accountNo + ".json");
    Map<String, dynamic> map = {};
    map["거래내역반복횟수"] = transactionCnt + 1;
    await http.patch(
      url,
      body: json.encode(map),
    );
  }

  var path = 'v3/user';
  final url = Uri.https(domain, "$path.json");
  var response = await http.get(url);
  Map<String, dynamic> userData = json.decode(response.body);
  userData.forEach((username, user) {
    var pathUser = username;
    for (int i = 0; i < (user["계좌목록"]).length; i++) {
      if (user["계좌목록"][i]["계좌번호"] == accountNo) {
        final patchUrl = Uri.https(domain, "$path/$pathUser/계좌목록/$i.json");
        Map<String, dynamic> map = {};
        map["거래내역반복횟수"] = transactionCnt + 1;
        http.patch(
          patchUrl,
          body: json.encode(map),
        );
      }
    }
  });
}

getAccountInfo(accountNo) async {
  var path = 'v3/account';
  final url = Uri.https(domain, "${"$path/" + accountNo}.json");
  final response = await http.get(url);
  var result = json.decode(response.body);
  return result;
}

void transfer(date, time, from, to, amount, memoFrom, memoTo, type) async {
  var balance = await getBalanceOf(from);
  if (balance >= amount) {
    patchTransaction(from, date, time, type, amount, 0, memoFrom, to);
    patchTransaction(to, date, time, type, 0, amount, memoTo, from);
  } else {
    print("출금가능금액이 부족합니다!");
  }
}

// 1원 인증 request 메서드
request1transfer() async {
  var path = 'v1/auth/1transfer';
  var dataBody = {
    "입금은행코드": "088",
    "입금계좌번호": "110222999999",
    "입금통장메모": "1234 SSAFY"
  };
  final url = Uri.https('shbhack.shinhan.com', path);
  Map<String, dynamic> map = {};
  map["dataHeader"] = {"apikey": "2023_Shinhan_SSAFY_Hackathon"};
  map["dataBody"] = dataBody;
  final response = await http.post(
    url,
    headers: {},
    body: json.encode(map),
  );
  return response;
}

// 유효한 계좌인지 체크하는 메서드
validAccountCheck() async {
  var response = await request1transfer();
  return json.decode(response.body)["dataHeader"]["successCode"] == "0";
}

// 1원이체 실명인증 메서드
// 현재 1원이체 메시지가 1234로 고정되어 있기 때문에, 1234입력하면 인증 성공, 다른 값 입력하면 인증 실패
auth1transfer(String input) {
  return input == "1234";
}

getList(action) async {
  var path = api3[action]['path'];
  final url = Uri.https(domain, path + ".json");
  var response = await http.get(url);
  var list = response.body;
  return list;
}

timeToDate(int time) {
  return "09${(time ~/ 24 + 1).toString().padLeft(2, '0')}";
}

void main() async {
  // initUser("도레미");
  // initUser("쏠");
  // patchAccount("슈", (random.nextInt(100000) + 100000).toString(), "입출금계좌",
  //     "쏠편한입출금통장", 100000, 0);
  // patchBalance("197104", 95000);
  // getAccountListOf("도레미");

  // List list = await loadData('user');
  // print(list);

  // var cnt = await getTransactionCnt("197104");
  // print(cnt);

  // patchBalance("121735", 5000, 0);

  // transfer("0913", 185, "105039", "165169", 7500, "보낸사람 메모", "받는사람 메모", "신한체크");
  // var response = await request1transfer();
  // var check = await validAccountcheck();
  // getSavingAccountListOf("도레미");

  // for (var userEntry in userData.entries) {
  //   var username = userEntry.key;
  //   var user = userEntry.value;

  //   Map<String, dynamic> accountList = user['accountList'];
  //   // for (var accountEntry in accountList.entries)
  //   print(accountList);
  // }
  // for (var item in .entries) {
  //   print(item.value);

  // var accountList = await
  // final url = Uri.https(domain, path + ".json");
  // Map<String, dynamic> map = new Map();
  // map["거래내역반복횟수"] = transactionCnt + 1;
  // await http.patch(
  //   url,
  //   body: json.encode(map),
  // );
  test();
}

void test() async {
  String user1 = "도레미";
  String user2 = "쏠";
  // initUser(user1);
  // initUser(user2);
  var user1Account = await getCheckingAccountListOf(user1);
  var user2Account = await getCheckingAccountListOf(user2);
  var user1AccountNo = user1Account["계좌번호"];
  var user2AccountNo = user2Account["계좌번호"];
  int time = 365;
  String date = timeToDate(time);
  transfer(
      date, time, user1AccountNo, user2AccountNo, 5000, "스타벅스", user1, "신한체크");
}
