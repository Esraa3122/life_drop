import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/enums/nav_bar_enum.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/images/app_images.dart';
import 'package:life_drop/features/donor/main/presentation/cubit/main_cubit_cubit.dart';
import 'package:life_drop/features/donor/main/presentation/widgets/icon_tap_nav_bar.dart';
import 'package:life_drop/features/donor/main/presentation/widgets/notification_bar_icon.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 88,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 103.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              //Icons
              Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 88.h,
                    color: context.color.navBarbg,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 45.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          child: BlocBuilder<MainCubitCubit, MainCubitState>(
                            builder: (context, state) {
                              final cubit = context.read<MainCubitCubit>();
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Donor Screen
                                  IconTapNavBar(
                                    onTap: () {
                                      cubit.selectedNavBarIcons(
                                          NavBarEnum.donors);
                                    },
                                    icon: AppImages.dropBlood,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.donors,
                                  ),
                                  //Notifications Screen
                                  GestureDetector(
                                    onTap: (){
                                      cubit.selectedNavBarIcons(
                                          NavBarEnum.notifications);
                                    },
                                    child: NotificationBarIcon(
                                      isSelected: 
                                          cubit.navBarEnum == NavBarEnum.notifications,
                                    ),
                                  ),
                                  //  IconTapNavBar(
                                  //   onTap: () {
                                  //     cubit.selectedNavBarIcons(
                                  //         NavBarEnum.notifications);
                                  //   },
                                  //   icon: AppImages.notificationIcon,
                                  //   isSelected:
                                  //       cubit.navBarEnum == NavBarEnum.notifications,
                                  // ),
                                  //Home Screen
                                  IconTapNavBar(
                                    onTap: () {
                                      cubit
                                          .selectedNavBarIcons(NavBarEnum.home);
                                    },
                                    icon: AppImages.homeTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.home,
                                  ),
                                  //Profile Screen
                                  IconTapNavBar(
                                    onTap: () {
                                      cubit.selectedNavBarIcons(
                                          NavBarEnum.profile);
                                    },
                                    icon: AppImages.profileTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.profile,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // BackGround Icon
              Positioned(
                top: -12,
                left: -8,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(context.images.bigNavBar!),
                      ),
                    ),
                  ),
                ),
              ),
              //donation Icon
              Positioned(
                  left: 26,
                  top: 3,
                  child: SvgPicture.asset(
                    AppImages.nowDonnor,
                    height: 40.h,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
