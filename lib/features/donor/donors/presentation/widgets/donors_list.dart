import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/loading/empty_screen.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/get_all_donor/get_all_donor_bloc.dart';
import 'package:life_drop/features/donor/donors/presentation/widgets/donors_item.dart';

class DonorsList extends StatelessWidget {
  const DonorsList({super.key});

  get donorList => null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDonorBloc, GetAllDonorState>(
      builder: (context, state) {
        return state.when(
            loading: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
            success: (donorNewList) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return DonorsItem(
                    donorModel: donorNewList[index],
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
                itemCount: donorNewList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            },
            empty: EmptyScreen.new,
            error: Text.new
          );
      },
    );
  }
}
