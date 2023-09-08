import 'package:http/http.dart' as http;
import 'dart:convert';
export 'api2.dart';

String date = "09" + ((time / 10).toInt() + 1).toString().padLeft(2, '0');
int time = 0;

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