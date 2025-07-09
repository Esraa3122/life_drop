import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/core/style/images/app_images.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      onTap: (){},
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
            color: Colors.pink,
            height: 30.h,
          ),
        ),
      ),
      title: TextApp(text: 'title', theme: context.textStyle.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
        color: context.color.textColor,
      ),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h,),
          TextApp(text: 'Body', theme: context.textStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeightHelper.medium,
            color: context.color.textColor,
          ),
        ),
        SizedBox(height: 5.h,),
        TextApp(text: 'Created At', theme: context.textStyle.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
        color: context.color.textColor,
      ),),
      SizedBox(height: 5.h,),
      Divider(color: context.color.textColor,),
        ],
      ),
      trailing: GestureDetector(
        onTap: (){},
        child: const Icon(
          Icons.close, 
          color: Colors.yellow,
          size: 20,
        ),
      ),
    );
  }
}