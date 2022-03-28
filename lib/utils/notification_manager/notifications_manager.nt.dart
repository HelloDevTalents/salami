import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  const NotificationManager(
    this._firebaseMessaging,
    this._flutterLocalNotifications,
  );

  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _flutterLocalNotifications;

  Future<void> init() async {
    if (Platform.isAndroid) {
      // we need custom channel with max importance to show notification
      // on android while app is open in the foreground
      await _flutterLocalNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      const initializeSettings = InitializationSettings(
        android: AndroidInitializationSettings('notification_logo'),
      );

      await _flutterLocalNotifications.initialize(initializeSettings);

      FirebaseMessaging.onMessage.listen(_showNotificationOnAndroidForeground);
    } else if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission(provisional: true);
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  // this function is used to show notification on android while app is open in
  // the foreground
  void _showNotificationOnAndroidForeground(RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      _flutterLocalNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'notification_logo',
            color: Colors.pink,
          ),
        ),
      );
    }
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used to show notifications while app is open',
  importance: Importance.max,
);
