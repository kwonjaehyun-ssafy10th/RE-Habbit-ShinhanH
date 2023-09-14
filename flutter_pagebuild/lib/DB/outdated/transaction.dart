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

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map['거래일자'] = this.date;
    map['거래시간'] = this.time;
    map['적요'] = this.type;
    map['출금금액'] = this.withdrawal;
    map['입금금액'] = this.deposit;
    map['내용'] = this.memo;
    map['잔액'] = this.balance;
    map['거래처'] = this.counterparty;
    return map;
  }

}

void main() {
  Transaction t1 = new Transaction("0910", 123, '신한체크', 5000, 0, "스타벅스", 95000, "영업점");
  print(t1.toMap());
}
