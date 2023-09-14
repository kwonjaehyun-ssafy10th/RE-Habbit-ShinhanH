import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'light_account.dart';
import 'light_api.dart';
import 'light_balance.dart';
import 'light_transaction.dart';
import 'light_transfer.dart';
import 'light_user.dart';
import 'shb_api.dart';
import 'package:flutter_pagebuild/controller/RegisController.dart';

String domain = 'shb-hackton-ad177-default-rtdb.firebaseio.com';
String version = '3';

Map<String, dynamic> api3 = {
  'account': {
    'path': 'account',
  },
  'transaction': {
    'path': 'transaction',
  },
  'balance': {
    'path': 'balance',
  },
  'user': {
    'path': 'user',
  }
};

Map<String, dynamic> keyMap3 = {
  'user': '고객명',
  'account': '계좌번호',
  'balance': '계좌번호',
  'transaction': '계좌번호',
  'notificatoin': '고객명'
};

//계좌 받아오는 로직 true-적금 false-입출금

//
dataToAccount(account, bool saving) {
  if (saving) {
    if (account["구분"].contains("적금")) {
      String accName = account["상품명"];
      String accNum = account["계좌번호"];
      return Account(accName, accNum);
    }
  } else {
    if (account["구분"].contains("입출금")) {
      String accName = account["상품명"];
      String accNum = account["계좌번호"];
      return Account(accName, accNum);
    }
  }
}
