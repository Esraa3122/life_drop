import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/widgets/custom_container_linear_donor.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/extensions/date_extension.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';

class DonorsItem extends StatelessWidget {
  const DonorsItem({
    super.key, 
    required this.donorModel, 
    required this.index, 
  });

  final AddDonorModel donorModel;
  final int index;
  
  

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearDonor(
      height: 210.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            const Spacer(),
            // Title
            DonorInfo(
              title: 'Name: ',
              body: donorModel.Name,
            ),
            const Spacer(),
            //Age
            DonorInfo(
              title: 'Age: ',
              body: donorModel.Age.toString(),
            ),
            const Spacer(),
            //Body
            DonorInfo(
              title: 'Governorate: ',
              body: donorModel.Governorate,
            ),
            const Spacer(),
            //Body
            DonorInfo(
              title: 'City: ',
              body: donorModel.City,
            ),
            const Spacer(),
            //Body
            DonorInfo(
              title: 'Blood Type: ',
              body: donorModel.BloodType,
            ),
            const Spacer(),
            //Body
            DonorInfo(
              title: 'Phone: ',
              body: donorModel.Phone.toString(),
            ),

            const Spacer(),
            DonorInfo(
              title: 'Latest donation: ',
              body: donorModel.LatestDonation.getFormatDayMonthYear(),
            ),
            const Spacer(),
            //Body
            DonorInfo(
              title: 'Condition: ',
              body: donorModel.Condition,
            ),
          ],
        ),
      ),
    );
  }
}

class DonorInfo extends StatelessWidget {
  const DonorInfo({
    required this.title,
    required this.body,
    super.key,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            color: context.color.bluePinkLight,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        SizedBox(height: 8.w),
        Flexible(
          child: TextApp(
            text: body,
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              color: context.color.textColor,
              fontFamily: FontFamilyHelper.poppinsEnglish,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ),
      ],
    );
  }
}
