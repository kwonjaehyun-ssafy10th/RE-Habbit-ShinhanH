import 'dart:math';
import 'account.dart';
import 'practice2.dart';

class User {
  String name;
  List<dynamic> accountList = [];
  List<dynamic> notificationList = [];

  Random random = Random();

  User(this.name) {
    accountList.add(Account(
        this.name,
        (random.nextInt(100000) + 100000).toString(),
        "입출금계좌",
        "자유로운SOL통장",
        100000).toMap());
    accountList.add(Account(this.name,
        (random.nextInt(100000) + 100000).toString(), "자유적금", "나만의SOL적금", 0).toMap());
    userCnt++;
  }

  toString() {
    return this.name + this.accountList.toString();
  }

  Map<dynamic, dynamic> toMap() {
    Map<dynamic, dynamic> map = new Map();
    map['고객명'] = this.name;
    Map<dynamic, dynamic> temp = new Map();
    for (int i = 0; i < this.accountList.length; i++) {
      temp[i] = this.accountList[i];
    }
    map['계좌목록'] = temp;
    return map;
  }
}

void main() {
  var user = User('김신한');
  print(user.toMap());
  print(user);
}
