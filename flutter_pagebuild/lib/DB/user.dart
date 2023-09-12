import 'dart:math';
import 'account.dart';
//import 'practice2.dart';

class User {
  String name;
  List<dynamic> accountList = [];
  List<dynamic> notificationList = [];

  Random random = Random();

  User(this.name) {
    accountList.add(Account(name, (random.nextInt(100000) + 100000).toString(),
        "입출금계좌", "쏠편한입출금통장", 100000));
    accountList.add(Account(name, (random.nextInt(100000) + 100000).toString(),
        "자유적금", "쏠편한작심3일적금", 0));
    //userCnt++;
  }

  @override
  toString() {
    return name + accountList.toString();
  }

  Map<dynamic, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['고객명'] = name;
    Map<String, dynamic> temp = {};
    for (int i = 0; i < accountList.length; i++) {
      temp[i.toString()] = accountList[i].toMap();
    }
    map['계좌목록'] = temp;
    return map;
  }
}

void main() {
  var user = User('김신한');
  print(user.toMap());
  print(user);
  print(user.accountList);
}
