import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/admin_app_bar.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/refactors/add_notification_body.dart';

class AddNotificationScreen extends StatelessWidget {
  const AddNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl <GetAllNotificationAdminBloc>()
        ..add(const GetAllNotificationAdminEvent.getAllNotificion(),
        ),
        ),
        BlocProvider(create: (context) => sl <AddNotificationBloc>()),
        BlocProvider(create: (context) => sl<SendNotificationBloc>()),
        ],
      child: Scaffold(
        backgroundColor:  context.color.mainColor,
        appBar: AdminAppBar(
          title: 'Notification',
          isMain: true,
          backgroundColor:  context.color.mainColor!,
        ),
        body: AddNotificationBody(),
      ),
    );
  }
}
