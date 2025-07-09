import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/app/bloc_observer.dart';
import 'package:life_drop/core/app/env.variables.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/service/hive/hive_database.dart';
import 'package:life_drop/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:life_drop/core/service/push_notification/local_notification_service.dart';
import 'package:life_drop/core/service/shared_pref/shared_pref.dart';
import 'package:life_drop/life_drop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvVariable.instance.init(envType: EnvTypeEnum.prod);

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyA5v3SEvRC-mDNYzb2w-lXWP385DgdpHA4",
              appId: "1:818723851680:android:5d0811a8097525741fa8c5",
              messagingSenderId: "818723851680",
              projectId: "life-drop-75282"),
        ).whenComplete(() {
          FirebaseCloudMessaging().init();
          LocalNotificationService.init();
        })
      : await Firebase.initializeApp().whenComplete(() {
          FirebaseCloudMessaging().init();
          LocalNotificationService.init();
        });

  await SharedPref().instantiatePreferences();

  await setupInjector();

  await HiveDatabase().setup();

  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {});

  runApp(const LifeDrop());
}
