import 'useroutdated.dart';
import 'notification.dart';

class SolAppPush {
  void push(Useroutdated to, Notification notification) {
    to.notificationList.add(notification);
  }
}
