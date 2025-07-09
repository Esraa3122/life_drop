import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/style/colors/colors_light.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/get_all_donor/get_all_donor_bloc.dart';

class DeleteDonorWidget extends StatelessWidget {
  const DeleteDonorWidget({super.key, required this.donorModel});

  final AddDonorModel donorModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddDonorBloc, AddDonorState>(
      listener: (context, state) {
         state.whenOrNull(
          success: () {
            context.read<GetAllDonorBloc>().add(
                  const GetAllDonorEvent.getAllDonor(),
                );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
                    return SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: const CircularProgressIndicator(
                        color: ColorsLight.white,
                      ),
                    );
                  },
          orElse: () {
            return InkWell(
          onTap: () async {
            context.read<AddDonorBloc>()
              ..add(AddDonorEvent.deleteDonor(donorModel: donorModel));
          },
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        );
          },
        );
      },
    );
  }
}
