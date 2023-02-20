import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {}

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: DarwinInitializationSettings(
                onDidReceiveLocalNotification: onDidReceiveLocalNotification));
    _notificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'nscc',
          'nscc channel',
          channelDescription: 'Channel for nscc to get Notifications',
          importance: Importance.high,
          priority: Priority.high,
        ),
      );
      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.body, notificationDetails);
    } catch (e) {
      rethrow;
    }
  }
}
