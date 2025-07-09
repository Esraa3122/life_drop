import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/core/style/images/app_images.dart';

import 'package:badges/badges.dart' as badges;
import 'package:life_drop/features/donor/notifications/data/models/notification_model.dart';
import 'package:life_drop/features/donor/notifications/presentation/controller/notification_controller.dart';

class NotificationBarIcon extends StatelessWidget {
  const NotificationBarIcon({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationModel>>(
        stream: NotificationController().getNotificationList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }

          final numberOfNotifi =
              snapshot.data!.where((e) => e.isSeen == false).length;
          return badges.Badge(
            showBadge: numberOfNotifi != 0,
            badgeAnimation: const badges.BadgeAnimation.scale(),
            position: badges.BadgePosition.topEnd(end: -4.w, top: -8.h),
            badgeContent: TextApp(
              text: numberOfNotifi >=9 ? '9+' : numberOfNotifi.toString(),
              theme: context.textStyle.copyWith(
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeightHelper.bold,
              ),
              textAlign: TextAlign.center,
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.pink,
              padding: EdgeInsets.all(5.h),
              elevation: 0,
            ),
            child: SvgPicture.asset(
              AppImages.notificationIcon,
              color: isSelected ? context.color.navBarSelectedTab : Colors.grey,
              height: 25.h,
            ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
          );
        });
  }
}
