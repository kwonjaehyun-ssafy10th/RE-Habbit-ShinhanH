import 'package:http/http.dart' as http;
import 'dart:convert';

String domain = 'shb-hackton-ad177-default-rtdb.firebaseio.com';

Future getDataMapOf(user) async {
  var path = 'service/user/$user';
  final url = Uri.https(domain, "$path.json");
  final response = await http.get(url);
  return json.decode(response.body);
}

void main() async {
  print(await getDataMapOf("도레미"));
  print(await getDataMapOf("최쏠"));
}
