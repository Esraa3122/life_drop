import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/routes/app_routes.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:life_drop/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:life_drop/features/auth/presentation/widgets/sign_up/sign_up_text_form.dart';
import 'package:life_drop/features/auth/presentation/widgets/sign_up/user_avatar_image.dart';
import 'package:life_drop/features/auth/presentation/widgets/sign_up_with_google.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
            child: Column(children: [
   
          //Dark mode and language
          const DarkAndLangButtons(),
          SizedBox(
            height: 15.h,
          ),
          // welcome Info
          TextApp(
              text: context.translate(LangKeys.signupWelcom),
              theme: context.textStyle.copyWith(
                  color: context.color.textColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeightHelper.bold,
                  fontFamily: FontFamilyHelper.pacifico)),
          SizedBox(
            height: 10.h,
          ),
          //User Avatar image
          const UserAvararImage(),

          SizedBox(
            height: 15.h,
          ),

          // SignUp TextForm
          const SignUpTextForm(),

          SizedBox(
            height: 20.h,
          ),
          //SignUpButton
          const SignUpButton(),

          SizedBox(
            height: 15.h,
          ),
          //SigninWithGoogle
          SigninWithGoogle(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
          ),

          // Go To Sign Up Screen

          CustomFadeInDown(
            duration: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextApp(
                    text: context.translate(LangKeys.doYouHaveAnAccount),
                    theme: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                      color: context.color.textColor,
                    )),
                TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(AppRoutes.login);
                  },
                  child: TextApp(
                      text: context.translate(LangKeys.login),
                      theme: context.textStyle.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeightHelper.bold,
                        color: context.color.bluePinkLight,
                      )),
                ),
              ],
            ),
          ),
        ])));
  }
}
