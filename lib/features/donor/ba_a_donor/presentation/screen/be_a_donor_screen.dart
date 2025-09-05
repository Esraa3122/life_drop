import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/customer_app_bar.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/style/images/app_images.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';
import 'package:life_drop/features/donor/ba_a_donor/presentation/refactors/be_a_donor_body.dart';

class BeADonorScreen extends StatelessWidget {
  const BeADonorScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) => sl<AddDonorBloc>()),
  ],
  child: Scaffold(
    appBar: CustomAppBar(
      title: context.translate(LangKeys.donateNow),
      color: context.color.textColor,
      backgroundColor: context.color.mainColor,
    ),
    backgroundColor: context.color.mainColor,
    body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.heartAdmin), fit: BoxFit.contain),
          ),
      child: BeADonorBody()),
  ),
);

  }
}