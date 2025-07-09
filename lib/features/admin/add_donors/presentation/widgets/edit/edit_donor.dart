import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/get_all_donor/get_all_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/widgets/edit/edit_donor_bottom_sheet.dart';

class EditDonor extends StatelessWidget {
  const EditDonor({super.key, required this.donorModel});

  final AddDonorModel donorModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomBottomSheet.showModalBottomSheetContainer(
            context: context, widget: EditDonorBottomSheet(DonorModel: donorModel,),
             whenComplete: () {
                context.read<GetAllDonorBloc>().add(
                      const GetAllDonorEvent.getAllDonor()
                    );
             }
        );
      },

      child: Icon(
        Icons.edit,
        color: Colors.yellow,
      ),
    );
  }
}
