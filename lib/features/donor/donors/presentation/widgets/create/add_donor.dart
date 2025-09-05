import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/common/widgets/custom_button.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/routes/app_routes.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';

class CreateNewDonor extends StatelessWidget {
  const CreateNewDonor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // titile
        CustomFadeInDown(
          duration: 400,
          child: TextApp(
            text: context.translate(LangKeys.donorpage),
            theme: context.textStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeightHelper.medium,
              fontFamily: FontFamilyHelper.poppinsEnglish,
            ),
          ),
        ),
        // bottom sheet
        CustomFadeInDown(
          duration: 400,
          child: CustomButton(
            onPressed: () {
              context.pushName(AppRoutes.beADonor);
            },
            backgroundColor: context.color.bluePinkLight,
            lastRadius: 10,
            threeRadius: 10,
            text: context.translate(LangKeys.donateNow),
            width: 145.w,
            height: 35.h,
          ),
        ),
      ],
    );
  }
}
