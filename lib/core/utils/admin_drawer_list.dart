import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/dialogs/donor_dialogs.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/core/utils/app_logout.dart';
import 'package:life_drop/features/admin/add_donors/presentation/screens/add_donor_screens.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/screens/add_notification_screen.dart';
import 'package:life_drop/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:life_drop/features/admin/users/presentation/screens/users_screen.dart';
import 'package:life_drop/features/auth/presentation/screens/login_screen.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    //DashBoard
    DrawerItemModel(
      icon: const Icon(
        Icons.dashboard,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'DashBoard',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeight.bold,
        ),
      ),
      page: const DashBoardScreen(),
    ),
    //Categories
    DrawerItemModel(
      icon: const Icon(
        Icons.bloodtype_rounded,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Donors',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeight.bold,
        ),
      ),
      page: const AddDonorScreen(),
    ),
    //Users
    DrawerItemModel(
      icon: const Icon(
        Icons.people_alt_outlined,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Users',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeight.bold,
        ),
      ),
      page: const UsersScreen(),
    ),
    //Notifications
    DrawerItemModel(
      icon: const Icon(
        Icons.notifications_active_rounded,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Notifications',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeight.bold,
        ),
      ),
      page: const AddNotificationScreen(),
    ),
    //LogOut
    DrawerItemModel(
      icon: const Icon(
        Icons.exit_to_app,
        color: Colors.white,
      ),
      title: GestureDetector(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Do you want log out?',
            textButton1: 'Yes',
            textButton2: 'No',
            isLoading: false,
            onPressed: () async {
              await AppLogout().logout();
            },
          );
        },
        child: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeightHelper.bold,
            fontSize: 17,
          ),
        ),
      ),
      page: const LoginScreen(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });

  final Icon icon;
  final Widget title;
  final Widget page;
}
