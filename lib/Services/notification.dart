// ignore_for_file: non_constant_identifier_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:myapp/models/user.dart';

class NotificationService {
  String notificationMsg = '';
  final firestoreInstance = FirebaseFirestore.instance;
  void UpdateToken({required User_Account user, required String token}) {
    firestoreInstance.collection("User").doc(user.uid).set({
      "token": token,
    }, SetOptions(merge: true));
  }

  void RemoveToken({required User_Account user}) {
    firestoreInstance.collection("User").doc(user.uid).set({
      "token": "None",
    }, SetOptions(merge: true));
  }

  void firebase_message_initialize() {
    // Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        notificationMsg =
            "${event.notification!.title} ${event.notification!.body} I am coming from terminated state";

        //print("initial " + notificationMsg);
      }
    });

    // Foregrand State
    FirebaseMessaging.onMessage.listen((event) async {
      //LocalNotificationService.showNotificationOnForeground(event);

      notificationMsg =
          "${event.notification!.title} ${event.notification!.body}";

      //print(notificationMsg);

      //show notification
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              //simgple notification
              id: DateTime.now().millisecondsSinceEpoch.remainder(10000000),
              channelKey: 'basic', //set configuration wuth key "basic"
              title: event.notification!.title,
              body: event.notification!.body,
              icon: 'resource://drawable/task',
              largeIcon: 'resource://drawable/task',
              payload: {"name": "Task Notify"}));
    });

    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      notificationMsg =
          "${event.notification!.title} ${event.notification!.body} I am coming from background";

      //print("opened " + notificationMsg);
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              //simgple notification
              id: DateTime.now().millisecondsSinceEpoch.remainder(10000000),
              channelKey: 'basic', //set configuration wuth key "basic"
              title: event.notification!.title,
              body: event.notification!.body,
              icon: 'resource://drawable/task',
              largeIcon: 'resource://drawable/task',
              payload: {"name": "Task Notify"}));
    });
  }
}
