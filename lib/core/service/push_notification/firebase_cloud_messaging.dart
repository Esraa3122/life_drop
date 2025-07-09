import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:life_drop/core/app/env.variables.dart';
import 'package:life_drop/core/common/toast/show_toast.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/service/push_notification/firebase_messaging_navigate.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() => _instance;

  FirebaseCloudMessaging._();

  static final FirebaseCloudMessaging _instance = FirebaseCloudMessaging._();

  static const String subscribkey = 'life-drop';

  final _firebaseMessaging = FirebaseMessaging.instance;

  ValueNotifier<bool> isNotificationSubscribe = ValueNotifier(true);

  bool isPermissionNotification = false;


  Future<void> init() async{
    //permission
     await _permissionsNotification();

    // forground
    FirebaseMessaging.onMessage
        .listen(FirebaseMessagingNavigate.forGroundHandler);

    // // terminated
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then(FirebaseMessagingNavigate.terminatedHandler);

    // // background
    FirebaseMessaging.onMessageOpenedApp
        .listen(FirebaseMessagingNavigate.backGroundHandler);
  }

   /// controller for the notification if user subscribe or unsubscribed
  /// or accpeted the permission or not

 Future<void> controllerForUserSubscribe(BuildContext context) async {
    if (isPermissionNotification == false) {
      await _permissionsNotification();
    } else {
      if (isNotificationSubscribe.value == false) {
        await _subscribeNotification();
        if (!context.mounted) return;
        ShowToast.showToastSuccessTop(
          message: context.translate(LangKeys.subscribedToNotifications),
          seconds: 2,
        );
      } else {
        await _unSubscribeNotification();
        if (!context.mounted) return;
        ShowToast.showToastSuccessTop(
          message: context.translate(LangKeys.unsubscribedToNotifications),
          seconds: 2,
        );
      }
    }
  }

  /// permissions to notifications
  Future<void> _permissionsNotification() async {
    final settings = await _firebaseMessaging.requestPermission(badge: false);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      /// subscribe to notifications topic
      isPermissionNotification = true;
      await _subscribeNotification();
      debugPrint('🔔🔔 User accepted the notification permission');
    } else {
      isPermissionNotification = false;
      isNotificationSubscribe.value = false;
      debugPrint('🔕🔕 User not accepted the notification permission');
    }
  }


  //// subscribe notification

  Future<void> _subscribeNotification() async {
    isNotificationSubscribe.value = true;
    await FirebaseMessaging.instance.subscribeToTopic(subscribkey);
    debugPrint('====🔔 Notification Subscribed 🔔=====');
  }

  ///unsubscribe notification
  Future<void> _unSubscribeNotification() async {
    isNotificationSubscribe.value = false;
    await FirebaseMessaging.instance.unsubscribeFromTopic(subscribkey);
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }

// send notification with api
  Future<void> sendTopicNotification({
    required String title,
    required String body,
    required int donorId,
  }) async {
    try {
      final response =
          await Dio().post<dynamic>(EnvVariable.instance.notifcationBaseUrl,
              options: Options(
                validateStatus: (_) => true,
                contentType: Headers.jsonContentType,
                responseType: ResponseType.json,
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': 'key=${EnvVariable.instance.firebaseKey}',
                },
              ),
              data: {
            "to": "</topics/$subscribkey>",
            "notification": {
              "title": title,
              "body": body,
            },
            'data': {'donorId': donorId}
          });
      debugPrint('Notification Created => ${response.data}');
    } catch (e) {
      debugPrint('Notification Error => $e');
    }
  }
 
}
