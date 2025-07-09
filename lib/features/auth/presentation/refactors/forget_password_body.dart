import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/auth/presentation/widgets/forget_password/forget_password_button.dart';
import 'package:life_drop/features/auth/presentation/widgets/forget_password/forget_password_text_form.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: TextApp(
                text: context.translate(LangKeys.enterYourEmailAddress), 
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
           const TextFildForgetPassword(),
           SizedBox(
              height: 30.h,
            ),
           const forgetPasswordBotton(),
          
          ],
        ),
      ),
    );
  }
}