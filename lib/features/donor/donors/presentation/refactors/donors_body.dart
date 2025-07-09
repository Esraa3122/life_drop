import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/features/donor/donors/presentation/widgets/create/add_donor.dart';
import 'package:life_drop/features/donor/donors/presentation/widgets/donors_list.dart';

class DonorsBody extends StatelessWidget {
  const DonorsBody({super.key, required this.scrollController,});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          children: [
            const CreateNewDonor(),
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  //Donors
                  SliverToBoxAdapter(
                    child: SizedBox(
                    height: 20,
                  ),
                  ),
                  SliverToBoxAdapter(
                    child: DonorsList(),
                  ),
                  SliverToBoxAdapter(
                      child: SizedBox(
                    height: 20,
                  )),
                  //Buttom
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 15.w),
                  //     child: CustomButton(
                  //       onPressed: () {
                  //       },
                  //       textColor: Colors.black,
                  //       text: context.translate(LangKeys.donateNow),
                  //       width: MediaQuery.of(context).size.width,
                  //       backgroundColor: context.color.bluePinkLight,
                  //       height: 50.h,
                  //       lastRadius: 10,
                  //       threeRadius: 10,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
