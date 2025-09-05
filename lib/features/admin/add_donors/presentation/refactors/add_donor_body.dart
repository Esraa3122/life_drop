import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/loading/empty_screen.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/get_all_donor/get_all_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/widgets/add_donor_item.dart';
import 'package:life_drop/features/admin/add_donors/presentation/widgets/create/create_donor.dart';

class AddDonorBody extends StatelessWidget {
  const AddDonorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          // create Donor title
          const CreateDonor(),
          // get all donor
           Expanded(
              child: CustomScrollView(
                     slivers: [
                       SliverToBoxAdapter(
                         child: SizedBox(
               height: 20.h,
                         ),
                       ),
                       SliverToBoxAdapter(
                         child: BlocBuilder<GetAllDonorBloc, GetAllDonorState>(
               builder: (context, state) {
                 return state.when(
                   loading: () {
                     return Center(
                       child: CircularProgressIndicator(
                         color:  context.color.textColor,
                       ),
                     );
                   },
                   success: (donorList) {
                     return ListView.separated(
                       itemBuilder: (context, index) {
                         return AddDonorItem(
                           donorModel: donorList[index],
                           index: index,
                         );
                       },
                       separatorBuilder: (context, index) => SizedBox(
                         height: 15.h,
                       ),
                       itemCount: donorList.length,
                       shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                     );
                   },
                   empty: EmptyScreen.new,
                   error: Text.new,
                 );
               },
            ),
            ),
              SliverToBoxAdapter(
               child: SizedBox(
               height: 20.h,
               ),
              )
              ],
             ),
            ),
          
          ],
        ),
            
    );
  }
}
