import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/enums/nav_bar_enum.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/features/donor/donors/presentation/screen/donors_screen.dart';
import 'package:life_drop/features/donor/home/presentation/screen/home_screen.dart';
import 'package:life_drop/features/donor/main/presentation/cubit/main_cubit_cubit.dart';
import 'package:life_drop/features/donor/main/presentation/refactors/bottom_nav_bar.dart';
import 'package:life_drop/features/donor/main/presentation/refactors/main_customer_app_bar.dart';
import 'package:life_drop/features/donor/notifications/presentation/screens/notifications_screen.dart';
import 'package:life_drop/features/donor/profile/presentation/screen/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainCubitCubit>(),
      child: Scaffold(
        appBar: const MainDonorAppBar(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(context.images.homeBg!), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<MainCubitCubit, MainCubitState>(
                    builder: (context, state) {
                  final cubit = context.read<MainCubitCubit>();
                  if (cubit.navBarEnum == NavBarEnum.donors) {
                    return const DonorsScreen();
                  } else if (cubit.navBarEnum == NavBarEnum.profile) {
                    return const ProfileScreen();
                  } else if (cubit.navBarEnum == NavBarEnum.notifications) {
                    return const NotificationsScreen();
                  }
                  return HomeScreen();
                }),
              ),
              const MainBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
