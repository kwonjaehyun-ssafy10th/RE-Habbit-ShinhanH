class Notification {
  String date = "";
  int time = 0;
  String message = "";

  Notification(this.date, this.time, this.message);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map['날짜'] = this.date;
    map['시간'] = this.time;
    map['내용'] = this.message;
    return map;
  }
}

void main() {
  Notification n1 = new Notification("0910", 123, "안녕하세요");
  print(n1.toMap());
}
