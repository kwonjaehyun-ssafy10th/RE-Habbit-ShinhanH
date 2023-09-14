import 'package:http/http.dart' as http;
import 'dart:convert';
import 'light_account.dart';
import 'light_api.dart';

String process(str) {
  return str["고객명"];
}

void main() async {
  // var account = getAccountInfo("150422").then((res) => {print(process(res))});
  // getAccountListOf("최쏠").then((res) => print(res));
  // // getAccountListOf("최쏠").then((res) => print(res[0]));
  // Map<String, dynamic> account = {"asd": "asd"};
  // getAccountListOf("최쏠")
  //     .then((res) => {account = res[0][0], print(account.toString())});
  // print(account.toString());
  // getAccountListOf("최쏠").then((res) => print(res[0][0]["계좌번호"]));

  // var list = await getAccountListOf("최쏠");

  // print(list[0][0].runtimeType);
  // initAccount(list[0][0]);
  var path = 'v' + version + '/' + api3['account']['path'];
  final url = Uri.https(domain, 'v3' + ".json");
  await http.patch(
    url,
    body: json.encode((await getAccountListOf("최쏠"))[0][0]),
  );
}
