import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/customer_app_bar.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';
import 'package:life_drop/features/donor/ba_a_donor/presentation/refactors/be_a_donor_body.dart';
import 'package:life_drop/features/donor/donors/presentation/widgets/create/create_donate_new_buttom_sheet.dart';

class BeADonorScreen extends StatelessWidget {
  const BeADonorScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
                  create: (context) => sl<AddDonorBloc>(),
                  child: const CreateNewDonorBottomSheet(),
                ),
        BlocProvider(
                  create: (context) => sl<AddDonorBloc>(),
                  child: const BeADonorBody(),
                ),
      ],
      child: Scaffold(
          appBar: CustomAppBar(
            title: context.translate(LangKeys.donateNow),
            color: Colors.white,
            backgroundColor: const Color.fromARGB(255, 153, 49, 49),
          ),
          backgroundColor: const Color.fromARGB(255, 249, 211, 208),
          body: const BeADonorBody(),
      ),
    );
  }
}