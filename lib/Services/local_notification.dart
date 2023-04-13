import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class LocalNotificationService {
  void notificationinitilize() {
    AwesomeNotifications().initialize('resource://drawable/task', [
      // notification icon
      NotificationChannel(
        channelGroupKey: 'basic_test',
        channelKey: 'basic',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
      ),

      NotificationChannel(
          channelGroupKey: 'image_test',
          channelKey: 'image',
          channelName: 'image notifications',
          channelDescription: 'Notification channel for image tests',
          defaultColor: Colors.redAccent,
          ledColor: Colors.white,
          channelShowBadge: true,
          importance: NotificationImportance.High)

      //add more notification type with different configuration
    ]);
  }

  void showNotificationOnForeground(RemoteMessage message) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      //simgple notification
      id: 123,
      channelKey: 'basic', //set configuration wuth key "basic"
      title: message.notification!.title,
      body: message.notification!.body,
    ));
  }
}
