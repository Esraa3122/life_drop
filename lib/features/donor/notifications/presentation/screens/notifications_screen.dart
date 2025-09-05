import 'package:flutter/material.dart';
import 'package:life_drop/features/donor/notifications/presentation/controller/notification_controller.dart';
import 'package:life_drop/features/donor/notifications/presentation/refactors/notifications_body.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final controller = NotificationController();

  @override
  void initState() {
    super.initState();
    // Mark all as seen once the page is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.markAllAsSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const NotificationBody();
  }
}
