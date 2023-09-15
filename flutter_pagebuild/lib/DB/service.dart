import 'package:http/http.dart' as http;
import 'dart:convert';

String domain = 'shb-hackton-ad177-default-rtdb.firebaseio.com';

Future getDataMapOf(user) async {
  var path = 'service/user/$user';
  final url = Uri.https(domain, "$path.json");
  final response = await http.get(url);
  return json.decode(response.body);
}

Map<String, dynamic> dataToMap(String name, String accountNo1, String accountNo2) {
  Map<String, dynamic> map = {};
  map['고객명'] = name;
  Map<String, dynamic> account = {};
  account['0'] = accountNo1;
  account['1'] = accountNo2;
  map['account'] = account;
  map['lastChecked'] = 0;
  Map<String, dynamic> stamp = {};
  stamp['day'] = 0;
  List stampCnt = [0, 0, 0];
  stamp['stampCnt'] = stampCnt;
  map['stmap'] = stamp;
  return map;
}

void patchUserData(user, accountNo1, accountNo2) async {
  var path = 'service/user/$user';
  final url = Uri.https(domain, "$path.json");
  await http.patch(
  url,
  body: json.encode(dataToMap(user, accountNo1, accountNo2)),
  );
}

void main() async {
  print(await getDataMapOf("도레미"));
  print(await getDataMapOf("최쏠"));
  patchUserData("박리노", "100301", "302581");
}
