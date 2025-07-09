import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/routes/app_routes.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/donor/home/presentation/widgets/custom_elevated_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              CustomFadeInRight(
                duration: 400,
                child: Center(
                  child: TextApp(
                    text: context.translate(LangKeys.donateBlood),
                    theme: context.textStyle.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: context.color.bluePinkDark,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomFadeInLeft(
                duration: 400,
                child: Center(
                  child: TextApp(
                    text: context.translate(LangKeys.saveALife),
                    theme: context.textStyle.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeightHelper.bold,
                      color: Color.fromARGB(255, 100, 100, 100),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomFadeInRight(
                duration: 400,
                child: Center(
                  child: TextApp(
                    text: context.translate(
                        LangKeys.YourBloodCanBringSmileInAnyOnePersonFace),
                    theme: context.textStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeightHelper.medium,
                      color: context.color.textColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomFadeInLeft(
                  duration: 400,
                  child:  CustomElevatedButtom(
                  onTap: () {
                    context.pushName(AppRoutes.beADonor);
                  },
                  child: TextApp(
                    text: context.translate(LangKeys.beABonor),
                    theme: context.textStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeightHelper.medium,
                      color: context.color.bluePinkDark,
                    ),
                  ),
                  height: 60,
                  width: 250, 
                  backgroundcolor: context.color.mainColor,
                ),
                  //    CustomElevatedButtom(
                  //       text: context.translate(LangKeys.beABonor),
                  //       backgroundcolor: context.color.mainColor,
                  //       color: context.color.bluePinkDark,
                  //       over: context.color.bluePinkLight,
                  //       onPressed: () {}),
                  ),
              SizedBox(
                height: 20,
              ),
              CustomFadeInRight(
                duration: 400,
                child: CustomElevatedButtom(
                  onTap: () {
                    context.pushName(AppRoutes.search);
                  },
                  child: TextApp(
                    text: context.translate(LangKeys.findADonor),
                    theme: context.textStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeightHelper.medium,
                      color: context.color.mainColor,
                    ),
                  ),
                  height: 60,
                  width: 250, 
                  backgroundcolor: context.color.bluePinkDark,
                ),
                // CustomElevatedButtom(
                //   text: context.translate(LangKeys.findADonor),
                //   backgroundcolor: context.color.bluePinkDark,
                //   color: context.color.mainColor,
                //   over: context.color.mainColor,
                //   onPressed: () {},
                // ),
              ),
            ],
          ),
        ),
    );
  }
}
