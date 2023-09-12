import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

Random random = new Random();

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
  final url = Uri.https(
      'shb-hackton-ad177-default-rtdb.firebaseio.com', path + ".json");
  Map<String, dynamic> temp = new Map();
  temp[map[keyName]] = map;
  await http.patch(
    url,
    body: json.encode(temp),
  );
}

Map<String, dynamic> userToMap(String name) {
  Map<String, dynamic> map = new Map();
  map['고객명'] = name;
  Map<String, dynamic> temp = new Map();
  temp['0'] = accountToMap(name, (random.nextInt(100000) + 100000).toString(),
      "입출금계좌", "쏠편한입출금통장", 100000, 0);
  temp['1'] = accountToMap(name, (random.nextInt(100000) + 100000).toString(),
      "자유적금", "쏠편한작심3일적금", 0, 0);
  map['계좌목록'] = temp;
  return map;
}

Map<String, dynamic> accountToMap(String name, String accountNo, String type,
    String title, int balance, int transactionCnt) {
  Map<String, dynamic> map = new Map();
  map['고객명'] = name;
  map['계좌번호'] = accountNo;
  map['구분'] = type;
  map['상품명'] = title;
  map['잔액'] = balance;
  map['거래횟수'] = transactionCnt;
  return map;
}

Map<String, dynamic> balanceToMap(int balance) {
  Map<String, dynamic> map = new Map();
  map['잔액'] = balance;
  return map;
}

Map<String, dynamic> transactionToMap(
    String date,
    int time,
    String type,
    int withdrawal,
    int deposit,
    String memo,
    int balance,
    String counterparty) {
  Map<String, dynamic> map = new Map();
  map['거래일자'] = date;
  map['거래시간'] = time;
  map['적요'] = type;
  map['출금금액'] = withdrawal;
  map['입금금액'] = deposit;
  map['내용'] = memo;
  map['잔액'] = balance;
  map['거래처'] = counterparty;
  return map;
}

void patchUser(String user) {
  patchToFirebase('user', userToMap(user));
}

void patchAccount(String name, String accountNo, String type, String title,
    int balance, int transactionCnt) {
  patchToFirebase('account',
      accountToMap(name, accountNo, type, title, balance, transactionCnt));
}

void patchBalance(String accountNo, int balance) {
  Map<String, dynamic> map = new Map();
  map['계좌번호'] = accountNo;
  map['잔액'] = balance;
  patchToFirebase('balance', map);
}

Future<List> loadData(action) async {
  var path = api3[action]['path'];
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

// getAccountList() async {
//   var response = await request("account");
//   for (var item in json.decode(response.body)["dataBody"].entries) {
//     if (item.key.length >= 4 && item.key.substring(0, 4) == "조회내역") {
//       for (var account in item.value) {
//         print(account);
//       }
//     }
//   }
// }

// getAccountListOf(String name) async {
//   var loadedData = await loadData('user');
//   print(loadedData.runtimeType);
//   if (loadedData) {
//     for (var item in loadedData) {
//     if (item.key == name) {
//       print(item.value);
//     }
//   }
//   }
// }

// void main() async {
//   // patchUser("도레미");
//   // patchAccount("슈", (random.nextInt(100000) + 100000).toString(), "입출금계좌",
//   //     "쏠편한입출금통장", 100000, 0);
//   // patchBalance("197104", 95000);
//   getAccountListOf("도레미");
// }
