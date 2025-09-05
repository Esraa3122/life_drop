import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/common/widgets/custom_linear_button.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/enums/nav_bar_enum.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/routes/app_routes.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/core/style/images/app_images.dart';
import 'package:life_drop/features/donor/main/presentation/cubit/main_cubit_cubit.dart';

class MainDonorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainDonorAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubitCubit>();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.color.mainColor,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      title: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (cubit.navBarEnum == NavBarEnum.donors) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInRight(
                  duration: 800,
                  child: TextApp(
                    text: context.translate(LangKeys.chooseDonors),
                    theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: context.color.textColor,
                    ),
                  ),
                ),
                CustomFadeInLeft(
                  duration: 800,
                  child: CustomLinearButton(
                      onPressed: () {
                        context.pushName(AppRoutes.search);
                      },
                      child: Center(
                        child: SvgPicture.asset(AppImages.search),
                      )),
                )
              ],
            );
            } else if (cubit.navBarEnum == NavBarEnum.notifications) {
              return CustomFadeInRight(
                duration: 800,
                child: Center(
                  child: TextApp(
                    text: context.translate(LangKeys.notifications),
                    theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: context.color.textColor,
                    ),
                  ),
                ),
              );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
