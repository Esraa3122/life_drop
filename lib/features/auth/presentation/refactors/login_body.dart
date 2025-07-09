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
import 'package:life_drop/features/auth/presentation/widgets/login/login_button.dart';
import 'package:life_drop/features/auth/presentation/widgets/login/login_text_form.dart';
import 'package:life_drop/features/auth/presentation/widgets/sign_up_with_google.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool state = true;
  bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Stack(children: [
            Image.asset(
              'assets/images/doner/bloodphoto.jpg',
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),

            SizedBox(
              height: 30.h,
            ),
            //Dark mode and language
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Container(child: const DarkAndLangButtons()),
            ),
            SizedBox(
              height: 50.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListView(shrinkWrap: true, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomFadeInUp(
                      duration: 600,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(80),
                                topLeft: Radius.circular(80))),
                        decoration: BoxDecoration(
                          color: context.color.mainColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                            topLeft: Radius.circular(80),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextApp(
                                text: context.translate(LangKeys.welcome),
                                theme: context.textStyle.copyWith(
                                    color: context.color.bluePinkLight,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeightHelper.bold,
                                    fontFamily: FontFamilyHelper.pacifico)),

                            const SizedBox(
                              height: 30,
                            ),
                            const LoginTextForm(),
                            const SizedBox(
                              height: 10,
                            ),
                            // forget password
                            CustomFadeInLeft(
                              duration: 400,
                              child: Container(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {
                                    context
                                        .pushName(AppRoutes.forgetPassword);
                                  },
                                  child: TextApp(
                                      text: context
                                          .translate(LangKeys.forgetPassword),
                                      theme: context.textStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeightHelper.bold,
                                        color: context.color.bluePinkLight,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LoginButton(),
                            const SizedBox(
                              height: 10,
                            ),
                            SigninWithGoogle(
                              height: 40.h,
                              width: 300.w,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Expanded(child: Divider()),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'or',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Expanded(child: Divider()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextApp(
                                    text: context
                                        .translate(LangKeys.dontHaveAnAccount),
                                    theme: context.textStyle.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeightHelper.regular,
                                      color: context.color.textColor,
                                    )),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .pushReplacementNamed(AppRoutes.signUp);
                                  },
                                  child: TextApp(
                                      text: context.translate(LangKeys.sinup),
                                      theme: context.textStyle.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeightHelper.bold,
                                        color: context.color.bluePinkLight,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ]),
        ));
  }
}
