import 'account.dart';

class Transaction {
  String date = "";
  int time = 0;
  String type = "";
  int withdrawal = 0;
  int deposit = 0;
  String memo = "";
  int balance = 0;
  String counterparty = "";

  Transaction(this.date, this.time, this.type, this.withdrawal, this.deposit,
      this.memo, this.balance, this.counterparty);
}
