import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/app/app_cubit/cubit_cubit.dart';
import 'package:life_drop/core/app/connectivity_controller.dart';
import 'package:life_drop/core/app/env.variables.dart';
import 'package:life_drop/core/common/screens/no_network_screen.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/language/app_localizations_setup.dart';
import 'package:life_drop/core/routes/app_routes.dart';
import 'package:life_drop/core/service/shared_pref/pref_keys.dart';
import 'package:life_drop/core/service/shared_pref/shared_pref.dart';
import 'package:life_drop/core/style/theme/app_theme.dart';

class LifeDrop extends StatelessWidget {
  const LifeDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnected,
        builder: (_, value, __) {
          if (value) {
            return BlocProvider(
              create: (context) => sl<CubitCubit>()
                ..changeAppThemeMode(
                    sharedMode: SharedPref().getBoolean(PrefKeys.themeMode))
                ..getSavedLanguage(),
              child: ScreenUtilInit(
                designSize: Size(375, 812),
                minTextAdapt: true,
                child: BlocBuilder<CubitCubit, CubitState>(
                  buildWhen: (previos, current) {
                    return previos != current;
                  },
                  builder: (context, state) {
                    final cubit = context.read<CubitCubit>();
                    return MaterialApp(
                      title: 'Life Drop',
                      debugShowCheckedModeBanner:
                          EnvVariable.instance.debugMode,
                      theme: cubit.isDark ? themeLight() : themeDark(),
                      locale: Locale(cubit.currentLangCode),
                      supportedLocales: AppLocalizationsSetup.supportedLocales,
                      localizationsDelegates:
                          AppLocalizationsSetup.localizationsDelegate,
                      localeResolutionCallback:
                          AppLocalizationsSetup.localeResolutionCallback,
                      builder: (context, Widget) {
                        return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Scaffold(
                            body: Builder(builder: (context) {
                              ConnectivityController.instance.init();
                              return Widget!;
                            }),
                          ),
                        );
                      },
                      navigatorKey: sl<GlobalKey<NavigatorState>>(),
                      onGenerateRoute: AppRoutes.onGenerateRoute,
                      initialRoute: SharedPref()
                                  .getString(PrefKeys.accessToken) !=
                              null
                          ? SharedPref().getString(PrefKeys.userRole) != 'admin'
                              ? AppRoutes.mainDonor
                              : AppRoutes.homeAdmin
                          : AppRoutes.login,
                    );
                  },
                ),
              ),
            );
          } else {
            return MaterialApp(
              title: 'No Network',
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              home: const NoNetWorkScreen(),
            );
          }
        });
  }
}
