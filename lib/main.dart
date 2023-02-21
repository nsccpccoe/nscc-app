import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/firebase_options.dart';
import 'package:get/get.dart';
import 'package:nscc_app/router/router.dart';
import 'package:nscc_app/router/routes_names.dart';

import 'services/local_notification_service.dart';
import 'services/notification_service.dart';

Future<void> backGroundMessageHandler(RemoteMessage message) async {
  // Action when background notification is received
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  LocalNotificationServices.initialize();
  FirebaseMessaging.onBackgroundMessage(backGroundMessageHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessagingMethods().listenOnMessage();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 840),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesNames.authPage,
          getPages: AppRoutes.routes,
          theme: ThemeData(
            fontFamily: "Poppins",
          ),
        );
      },
    );
  }
}
