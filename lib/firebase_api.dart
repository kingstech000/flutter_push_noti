import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_push_noti/main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title : ${message.notification!.title}");
  print("body : ${message.notification!.body}");
  print("Payload : ${message.notification!.bodyLocKey}");
}

class FireBaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState!.pushNamed("notification");
  }


  Future initPushNotificatio() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print(fCMToken);
    // FirebaseMessaging.onBackgroundMessage();
  }
}
