import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:life_drop/core/app/app_cubit/cubit_cubit.dart';
import 'package:life_drop/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:life_drop/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:life_drop/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:life_drop/core/service/graphql/api_service.dart';
import 'package:life_drop/core/service/graphql/dio_factory.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/get_all_donor/get_all_donor_bloc.dart';

import 'package:life_drop/features/admin/add_notifications/data/data_source/add_notificaion_data_source.dart';
import 'package:life_drop/features/admin/add_notifications/data/repo/add_notification_repo.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';

import 'package:life_drop/features/admin/dashboard/data/data_soruce/dashboard_data_source.dart';
import 'package:life_drop/features/admin/dashboard/data/repos/dashboard_repo.dart';
import 'package:life_drop/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';

import 'package:life_drop/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:life_drop/features/admin/users/data/data_sources/users_data_source.dart';
import 'package:life_drop/features/admin/users/data/repos/users_repo.dart';
import 'package:life_drop/features/admin/users/presentation/bloc/delete_user/delete_user_bloc.dart';
import 'package:life_drop/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:life_drop/features/auth/data/data_source/auth_data_source.dart';
import 'package:life_drop/features/auth/data/repos/auth_repo.dart';
import 'package:life_drop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:life_drop/features/donor/main/presentation/cubit/main_cubit_cubit.dart';
import 'package:life_drop/features/donor/profile/data/data_source/profile_data_source.dart';
import 'package:life_drop/features/donor/profile/data/repos/profile_repo.dart';
import 'package:life_drop/features/donor/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:life_drop/features/donor/search/presentation/bloc/bloc/search_bloc.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initDashBoard();
  await _initDonorAdmin();
  await _initUsersAdmin();
  await _initAddNotification();
  await _initMain();
  await _initProfile();
  await _initSearch();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory(CubitCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadImageCubit(sl()))
    // ..registerFactory(ShareCubit.new)
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}

Future<void> _initDashBoard() async {
  sl
    ..registerLazySingleton(() => DashBoardDataSource(sl()))
    ..registerLazySingleton(() => DashBoardRepo(sl()))
    ..registerFactory(() => CategoriesNumberBloc(sl()))
    ..registerFactory(() => UsersNumberBloc(sl()));
}

Future<void> _initDonorAdmin() async {
  sl
    ..registerFactory(AddDonorBloc.new)
    ..registerFactory(GetAllDonorBloc.new);
  // ..registerLazySingleton(() => AddDonorRepo(sl()))
  // ..registerLazySingleton(AddDonorDataSource.new);
}

Future<void> _initUsersAdmin() async {
  sl
    ..registerLazySingleton(() => UsersRepo(sl()))
    ..registerLazySingleton(() => UserDataSource(sl()))
    ..registerFactory(() => GetAllUsersBloc(sl()))
    ..registerFactory(() => DeleteUserBloc(sl()));
}

Future<void> _initAddNotification() async {
  sl
    ..registerFactory(AddNotificationBloc.new)
    ..registerFactory(GetAllNotificationAdminBloc.new)
    ..registerFactory(() => SendNotificationBloc(sl()))
    ..registerLazySingleton(() => AddNotificationRepo(sl()))
    ..registerLazySingleton(AddNotificationDataSource.new);
}

Future<void> _initMain() async {
  sl.registerFactory(MainCubitCubit.new);
}

Future<void> _initProfile() async {
  sl
    ..registerFactory(() => ProfileBloc(sl()))
    ..registerLazySingleton(() => ProfileRepo(sl()))
    ..registerLazySingleton(() => ProfileDataSource(sl()));
}

Future<void> _initSearch() async {
  sl..registerFactory(() => SearchBloc());
}
