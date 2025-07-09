import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/admin_app_bar.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/style/colors/colors_light.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/get_all_donor/get_all_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/refactors/add_donor_body.dart';


class AddDonorScreen extends StatelessWidget {
  const AddDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl <GetAllDonorBloc>()
        ..add(const GetAllDonorEvent.getAllDonor(),
        ),
        ),
        BlocProvider(create: (context) => sl <AddDonorBloc>()),
        ],
      child: Scaffold(
        backgroundColor: ColorsLight.mainColor,
        appBar: AdminAppBar(
          title: 'Donor',
          isMain: true,
          backgroundColor: ColorsLight.mainColor,
        ),
        body: AddDonorBody(),
      ),
    );
  }
}
