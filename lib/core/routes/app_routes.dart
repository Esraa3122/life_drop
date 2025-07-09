import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:life_drop/core/common/screens/custom_web_view.dart';
import 'package:life_drop/core/common/screens/under_build_screen.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/routes/base_routes.dart';
import 'package:life_drop/features/admin/home_admin/presentation/screens/home_admin_screen.dart';
import 'package:life_drop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:life_drop/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:life_drop/features/auth/presentation/screens/login_screen.dart';
import 'package:life_drop/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:life_drop/features/donor/ba_a_donor/presentation/screen/be_a_donor_screen.dart';
import 'package:life_drop/features/donor/search/presentation/screen/search_screen.dart';
import 'package:life_drop/features/donor/main/presentation/cubit/main_cubit_cubit.dart';
import 'package:life_drop/features/donor/main/presentation/screen/main_screen.dart';

class AppRoutes {
  static const String login = "login";
  static const String signUp = "signUp";
  static const String homeAdmin = "homeAdmin";
  static const String mainDonor = "main-screen";
  static const String webview = "webview";
  static const String search = "search";
  static const String forgetPassword = "forgetPassword";
  static const String beADonor = "beADonor";

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: LoginScreen(),
          ),
        );
      case signUp:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<AuthBloc>(),
              ),
            ],
            child: const SignUpScreen(),
          ),
        );
      case forgetPassword:
        return BaseRoute(page: ForgetPasswordScreen());
      case homeAdmin:
        return BaseRoute(page: HomeAdminScreen());
      case mainDonor:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => sl<MainCubitCubit>(),
          child: const MainScreen(),
        ));
      case webview:
        return BaseRoute(
          page: CustomWebView(
            url: args! as String,
          ),
        );
      case beADonor:
        return BaseRoute(
          page: const BeADonorScreen(),
        );
      case search:
        return BaseRoute(
          page: const SearchScreen(),
        );
      default:
        return BaseRoute(page: PageUnderBuildScreen());
    }
  }
}
