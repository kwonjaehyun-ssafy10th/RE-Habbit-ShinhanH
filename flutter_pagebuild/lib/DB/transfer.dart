import 'account.dart';
import 'transaction.dart';
import 'api2.dart';

class Transfer {
  void transfer(Account from, Account to, int amount, String memoFrom,
      String memoTo, String type) {
    if (from.balance >= amount) {
      from.balance -= amount;
      to.balance += amount;
      from.transaction.add(Transaction(
          date, time, type, amount, 0, memoFrom, from.balance, to.name));
      to.transaction.add(Transaction(
          date, time, type, 0, amount, memoTo, to.balance, from.name));
    } else {
      print("출금가능금액이 부족합니다!");
    }
  }
}
