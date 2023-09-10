class Account {
  String name = "";
  String accountNo = "";
  String type = "";
  String title = "";
  int balance = 0;
  List<dynamic> transactionList = [];

  Account(this.name, this.accountNo, this.type, this.title, this.balance);

  toString() {
    return "[name: " +
        this.name +
        ", accountNo: " +
        this.accountNo +
        ", type: " +
        this.type +
        ", title: " +
        this.title +
        ", balance: " +
        this.balance.toString() +
        "]";
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map['고객명'] = this.name;
    map['계좌번호'] = this.accountNo;
    map['구분'] = this.type;
    map['상품명'] = this.title;
    return map;
  }
}

void main() {
  Account a1 = new Account("김신한", "123", "적금", "내적금", 300000);
  print(a1);
  print(a1.toMap());
}
