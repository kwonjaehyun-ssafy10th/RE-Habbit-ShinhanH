import 'package:http/http.dart' as http;
import 'dart:convert';

// action에 따른 api 호출할 수 있는 api 맵
Map<String, dynamic> api = {
  'account': {
    'path': 'v1/account',
    'dataBody': {"실명번호": "WmokLBDC09/yfin=="}
  },
  'transaction': {
    'path': 'v1/search/transaction',
    'dataBody': {"계좌번호": "110184999999"}
  },
  'balance': {
    'path': 'v1/account/balance/detail',
    'dataBody': {"출금계좌번호": "11018499"}
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

// 원하는 action에 따라 response 받아오는 request 메서드
Future<http.Response> request(action) async {
  var path = api[action]['path'];
  var dataBody = api[action]['dataBody'];
  final url = Uri.https('shbhack.shinhan.com', path);
  Map<String, dynamic> map = new Map();
  map["dataHeader"] = {"apikey": "2023_Shinhan_SSAFY_Hackathon"};
  map["dataBody"] = api[action]['dataBody'];
  final response = await http.post(
    url,
    headers: {},
    body: json.encode(map),
  );
  return response;
}

getAccountList() async {
  var response = await request("account");
  for (var item in json.decode(response.body)["dataBody"].entries) {
    if (item.key.length >= 4 && item.key.substring(0, 4) == "조회내역") {
      for (var account in item.value) {
        print(account);
      }
    }
  }
}

void main() async {
  getAccountList();
}
