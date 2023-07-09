// ignore_for_file: must_be_immutable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/LoginPage/login-page.dart';
import 'package:myapp/MainTabPage/MainTab.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/Services/local_notification.dart';
import 'package:myapp/Services/notification.dart';
import 'package:myapp/utils.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String notificationMsg = '';
  late FirebaseMessaging messaging;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Mobile task management and notification application',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: Auth().authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                WidgetsFlutterBinding.ensureInitialized();
                LocalNotificationService().notificationinitilize();
                messaging = FirebaseMessaging.instance;
                NotificationService().firebase_message_initialize();
                return const MainTab();
              } else {
                return const LoginPage();
              }
            },
          ),
        ),
      ),
    );
  }
}

// Future<void> _messageHandler(RemoteMessage message) async {
//   //print('background message ${message.notification!.body}');
// }
//FirebaseMessaging.onBackgroundMessage(_messageHandler);