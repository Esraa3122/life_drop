import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';
import 'package:life_drop/features/donor/ba_a_donor/presentation/widgets/containar_donation.dart';

class BeADonorBody extends StatelessWidget {
 const BeADonorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            BlocProvider(
              create: (_) => AddDonorBloc(),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ContainarDonation(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

