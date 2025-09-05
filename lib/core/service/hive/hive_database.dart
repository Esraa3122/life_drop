import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';
import 'package:life_drop/features/admin/add_notifications/data/models/add_notification_model.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;

  HiveDatabase._();

  static final HiveDatabase _instance = HiveDatabase._();

  Box<AddNotificationModel>? notificationBox;
  Box<AddDonorModel>? donorBox;
  // Box<SearchModel>? searchBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(AddNotificationModelAdapter())
      ..registerAdapter(AddDonorModelAdapter());
    // ..registerAdapter(SearchModelAdapter());

    notificationBox = await Hive.openBox<AddNotificationModel>(
      'notification_box',
    );
    donorBox = await Hive.openBox<AddDonorModel>('donor_box');
    // searchBox = await Hive.openBox<SearchModel>('search_box');
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
    // await donorBox!.clear();
    // await searchBox!.clear();
  }
}
