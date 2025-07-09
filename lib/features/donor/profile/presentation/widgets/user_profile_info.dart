import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/extensions/string_exetension.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/auth/data/models/user_role_response.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key, required this.userInfo});

  final UserRoleResponse userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: CachedNetworkImage(
            height: 80.h,
            width: 80.w,
            fit: BoxFit.fill,
            imageUrl: userInfo.userImage!,
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: Colors.red,
              size: 70,
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        TextApp(
          text: userInfo.userName!.toLowerCase().toCapitalized(),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        TextApp(
          text: userInfo.userEmail!,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}
