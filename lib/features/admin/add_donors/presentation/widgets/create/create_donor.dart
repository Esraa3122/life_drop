import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:life_drop/core/common/widgets/custom_button.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/colors/colors_light.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/get_all_donor/get_all_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/widgets/create/create_donor_bottom_sheet.dart';

class CreateDonor extends StatelessWidget {
  const CreateDonor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // titile
        TextApp(
          text: 'Donors',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.medium,
            fontFamily: FontFamilyHelper.poppinsEnglish,
          ),
        ),
        // bottom sheet
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: 
        BlocProvider(
                create: (context) => sl<AddDonorBloc>(),
                child: const CreateDonorBottomSheet(),
              ),
              whenComplete: () {
                context.read<GetAllDonorBloc>().add(
                      const GetAllDonorEvent.getAllDonor()
                    );
              },
            );
          },
          backgroundColor: ColorsLight.pinkDark,
          lastRadius: 10,
          threeRadius: 10,
          text: 'Add',
          width: 90.w,
          height: 35.h,
        ),
      ],
    );
  }
}