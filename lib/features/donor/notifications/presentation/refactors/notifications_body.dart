import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/core/style/images/app_images.dart';
import 'package:life_drop/features/donor/notifications/data/models/notification_model.dart';
import 'package:life_drop/features/donor/notifications/presentation/controller/notification_controller.dart';
import 'package:life_drop/features/donor/notifications/presentation/widgets/notifications_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = NotificationController();

    return StreamBuilder<List<NotificationModel>>(
      stream: controller.getNotificationList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.notificationIcon, color: context.color.textColor, height: 150.h,),
              SizedBox(height: 20.h),
              Center(child: TextApp(text: 'No Notifications yet', theme: TextStyle(
                fontSize: 20.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.bold
              ),)),
            ],
          );
        }

        final notifications = snapshot.data!;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: ListView.separated(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final item = notifications[index];
              return NotificationsItem(notification: item);
            },
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
          ),
        );
      },
    );
  }
}