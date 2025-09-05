import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/admin_app_bar.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
// import 'package:life_drop/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';

import 'package:life_drop/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:life_drop/features/admin/dashboard/presentation/refactors/dashboard_body.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
        // BlocProvider(
        //   create: (context) => sl<CategoriesNumberBloc>()
        //     ..add(const CategoriesNumberEvent.getCategoriesNumber()),
        // ),
        BlocProvider(
          create: (context) => sl<UsersNumberBloc>()
            ..add(const UsersNumberEvent.getUsersNumber()),
        ),
      ],
      child: Scaffold(
          backgroundColor: context.color.mainColor,
          appBar: AdminAppBar(
            title: 'DashBoard',
            isMain: true,
            backgroundColor: context.color.mainColor!,
          ),
          body: DashBoardBody()),
    );
  }
}
