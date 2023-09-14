import 'user.dart';
import 'notification.dart';

class SolAppPush {
  void push(User to, Notification notification) {
    to.notificationList.add(notification);
  }
}
