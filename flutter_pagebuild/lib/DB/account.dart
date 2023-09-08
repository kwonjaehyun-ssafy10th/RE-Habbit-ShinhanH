class Account {
  String name = "";
  String accountNo = "";
  String type = "";
  String title = "";
  int balance = 0;
  List<dynamic> transaction = [];

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
}

void main() {
  Account a1 = new Account("김신한", "123", "적금", "내적금", 300000);
  print(a1);
}
