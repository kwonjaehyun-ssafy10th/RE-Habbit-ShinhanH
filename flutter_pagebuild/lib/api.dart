import 'package:http/http.dart' as http;
import 'dart:convert';

// TERMINAL -> pub add http

Future<http.Response> request() async {
  final url = Uri.https('shbhack.shinhan.com', 'v1/account');
  final response = await http.post(
    url,
    headers: {},
    body: json.encode({
      "dataHeader": {"apikey": "2023_Shinhan_SSAFY_Hackathon"},
      "dataBody": {"실명번호": "WmokLBDC09/yfin=="}
    }),
  );
  return response;
}

// ElevatedButton(
//               child: Text('테스트 버튼'),
//               onPressed: () async {
//                 controller.increment;
//                 var response = await controller.request();
//                 print(response.body);
//               })