import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/routes/app_routes.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //initial notification with android and ios

  static Future<void> init() async {
    final settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
    );
  }


  static void onTap(NotificationResponse notificationResponse) {
    // navigator
     if (int.parse(notificationResponse.payload.toString()) != -1) return;
      sl<GlobalKey<NavigatorState>>().currentState!.context.pushName(AppRoutes.beADonor,
          arguments: int.parse(notificationResponse.payload.toString()));
    }
    

  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'life-drop-id',
          'life-drop-name',
          importance: Importance.max,
          priority: Priority.high,
          channelShowBadge: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ));
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
