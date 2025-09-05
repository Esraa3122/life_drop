import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/service/shared_pref/pref_keys.dart';
import 'package:life_drop/core/service/shared_pref/shared_pref.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/core/style/images/app_images.dart';
import 'package:life_drop/core/utils/app_strings.dart';
import 'package:life_drop/features/donor/notifications/data/models/notification_model.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      onTap: () async{
        final userId = SharedPref().getInt(PrefKeys.userId).toString();
        await FirebaseFirestore.instance
            .collection(usersCollection)
            .doc(userId)
            .collection(notificationCollection)
            .doc(notification.notificationId)
            .update({'isRead': true});

             showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: context.color.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          notification.title,
          style: context.textStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.bold,
            color: context.color.bluePinkLight,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.body,
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.medium,
                color: context.color.textColor,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close", style: TextStyle(color: Colors.red),),
          )
        ],
      );
    },
  );
      },
      leading: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.notificationIcon,
            color:  notification.isRead ? Colors.grey : Colors.pink,
            height: 30.h,
          ),
        ),
      ),
      title: TextApp(
        text: notification.title,
        theme: context.textStyle.copyWith(
          fontSize: 12.sp,
          fontWeight: notification.isRead
            ? FontWeightHelper.medium   
            : FontWeightHelper.bold,
          color: context.color.textColor,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Text(
            notification.body,
            maxLines: 2,
            style: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.medium,
              color: context.color.textColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 5.h),
          TextApp(
            text: notification.createdAt, 
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: notification.isRead
            ? FontWeightHelper.regular   
            : FontWeightHelper.medium,
              color: context.color.textColor,
            ),
          ),
          SizedBox(height: 5.h),
          Divider(color: context.color.textColor),
        ],
      ),
      trailing: GestureDetector(
        onTap: () async{
          final userId = SharedPref().getInt(PrefKeys.userId).toString();
          await FirebaseFirestore.instance
              .collection(usersCollection)
              .doc(userId)
              .collection(notificationCollection)
              .doc(notification.notificationId)
              .delete();
        },
        child: const Icon(
          Icons.close,
          color: Colors.yellow,
          size: 20,
        ),
      ),
    );
  }
}
