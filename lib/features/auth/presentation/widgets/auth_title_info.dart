import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({
    required this.description,
    required this.title,
    super.key,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          // title
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
                fontSize: 24.sp,
                color: context.color.textColor,
                fontWeight: FontWeightHelper.bold,
                fontFamily: FontFamilyHelper.pacifico),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextApp(
            text: description,
            theme: context.textStyle.copyWith(
              fontSize: 20.sp,
              color: context.color.textColor,
              fontWeight: FontWeightHelper.medium,
              fontFamily: FontFamilyHelper.pacifico,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
