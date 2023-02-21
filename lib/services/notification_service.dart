import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';

class FirebaseMessagingMethods {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> get token async => await _firebaseMessaging.getToken();

  void listenOnMessage() async {
    // Notification Stack
    _firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        log(message.toMap().toString());
      }
    });
    // Listen Foreground notification
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      if (message != null) {
        log(message.notification!.title!);
        log(message.notification!.body!);
        // Show local notification
        LocalNotificationServices.display(message);
      }
    });
  }

  // Background Notification OnTap
  void listenOnMessagedAppOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log(message.data['data']);
    });
  }
}
