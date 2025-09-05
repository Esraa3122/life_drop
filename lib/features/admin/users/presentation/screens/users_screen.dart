import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/admin_app_bar.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/features/admin/users/presentation/bloc/delete_user/delete_user_bloc.dart';
import 'package:life_drop/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:life_drop/features/admin/users/presentation/refactors/users_body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllUsersBloc>()
          ..add(GetAllUsersEvent.getAllUsers(isNotLoading: true),),),
        BlocProvider(create: (context) => sl<DeleteUserBloc>()),
      ],
      child: Scaffold(
        backgroundColor: context.color.mainColor,
        appBar: AdminAppBar(
          title: 'Users',
          isMain: true,
          backgroundColor:  context.color.mainColor!,
        ),
        body:UsersBody(),
      ),
    );
  }
}
