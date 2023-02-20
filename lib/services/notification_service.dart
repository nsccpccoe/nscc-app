import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';

class FirebaseMessagingMethods {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> get token async => await _firebaseMessaging.getToken();

  void listenOnMessage() async {
    _firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        // FireStoreMethods().addNotification(
        //   NotificationModel(
        //       dateTime: DateTime.now(), outpassId: message.data['outpass']),
        // );
        log(message.toMap().toString());
      }
    });
    String? token = await _firebaseMessaging.getToken();

    log('Listening app messages in foreground');
    log('$token');
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      if (message != null) {
        // FireStoreMethods().addNotification(
        //   NotificationModel(
        //       dateTime: DateTime.now(), outpassId: message.data['outpass']),
        // );
        log(message.notification!.title!);
        log(message.notification!.body!);

        LocalNotificationServices.display(message);
      }
    });
  }

  void listenOnMessagedAppOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log(message.data['data']);
    });
  }
}
