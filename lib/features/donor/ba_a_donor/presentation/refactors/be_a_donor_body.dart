import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:life_drop/features/donor/ba_a_donor/presentation/widgets/button_donation.dart';
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
            Column(
              children: [
            SizedBox(height: 20,),
            ContainarDonation(
            ),
            SizedBox(height: 15,),
            ButtonDonation(),
              ],
            ),
          ],
        ),
      
      ],
    );
  }
  
}
