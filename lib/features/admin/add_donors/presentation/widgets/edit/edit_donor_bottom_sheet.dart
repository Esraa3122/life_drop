import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/widgets/custom_button.dart';
import 'package:life_drop/core/common/widgets/custom_text_field.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/colors/colors_light.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';


class EditDonorBottomSheet extends StatefulWidget {
  const EditDonorBottomSheet({super.key, required this.DonorModel});

  final AddDonorModel DonorModel;
  @override
  State<EditDonorBottomSheet> createState() => _EditDonorBottomSheetState();
}

class _EditDonorBottomSheetState extends State<EditDonorBottomSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController governorateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController latestDonationController = TextEditingController();
  TextEditingController conditionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.DonorModel.Name;
    ageController.text = widget.DonorModel.Age.toString();
    phoneController.text = widget.DonorModel.Phone.toString();
    governorateController.text = widget.DonorModel.Governorate;
    cityController.text = widget.DonorModel.City;
    bloodTypeController.text = widget.DonorModel.BloodType;
    latestDonationController.text = widget.DonorModel.LatestDonation.toString();
    conditionController.text = widget.DonorModel.Condition;
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    governorateController.dispose();
    cityController.dispose();
    bloodTypeController.dispose();
    latestDonationController.dispose();
    conditionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Edit Donor Title
            Center(
              child: TextApp(
                text: 'Edit Donor',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            //Enter the Donor name
            TextApp(
              text: 'Edit the Donor name',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // title for Donor TextForm
            CustomTextField(
              controller: nameController,
              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected The Donor Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),

            //Enter the Donor age
            TextApp(
              text: 'Edit the Donor age',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // age for Donor TextForm
            CustomTextField(
              controller: ageController,
              hintText: 'Age',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected The Donor Age';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            //Enter the Donor Phone
            TextApp(
              text: 'Edit the Donor Phone',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // Phone for Donor TextForm
            CustomTextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected The Donor Phone ';
                }
                return null;
              },
              hintText: 'Phone',
            ),
            SizedBox(height: 20.h),
            //Enter the Donor Governorate
            TextApp(
              text: 'Edit the Donor Governorate',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // Governorate for Donor TextForm
            CustomTextField(
              controller: governorateController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected The Donor Governorate ';
                }
                return null;
              },
              hintText: 'Governorate',
            ),
            SizedBox(height: 20.h),
            //Enter the Donor City
            TextApp(
              text: 'Edit the Donor City',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // City for Donor TextForm
            CustomTextField(
              controller: cityController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected The Donor City ';
                }
                return null;
              },
              hintText: 'City',
            ),
            SizedBox(height: 20.h),
            //Enter the Donor Blood_Type
            TextApp(
              text: 'Edit the Donor Blood Type',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // Blood_Type for Donor TextForm
            CustomTextField(
              controller: bloodTypeController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected The Donor Blood Type ';
                }
                return null;
              },
              hintText: 'Blood Type',
            ),
            SizedBox(height: 20.h),
            //Enter the Donor Latest_Donation
            TextApp(
              text: 'Edit the Donor Latest Donation',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // Latest_Donation for Donor TextForm
            CustomTextField(
              controller: latestDonationController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected The Donor Latest Donation';
                }
                return null;
              },
              hintText: 'Latest Donation',
            ),
            SizedBox(height: 20.h),
            //Enter the Donor Condition
            TextApp(
              text: 'Edit the Donor Condition',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // Condition for Donor TextForm
            CustomTextField(
              controller: conditionController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected The Donor Condition ';
                }
                return null;
              },
              hintText: 'Condition',
            ),
            SizedBox(height: 20.h),
            //Button
             CustomButton(
                      onPressed: () {
                        _validAddDonor(context);
                      },
                      backgroundColor: ColorsLight.white,
                      lastRadius: 20,
                      threeRadius: 20,
                      textColor: context.color.bluePinkDark,
                      text: 'Edit a Donor',
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                    )
          ],
        ),
      ),
    );
  }

  void _validAddDonor(BuildContext context) {
    if (formKey.currentState!.validate()) {
      widget.DonorModel.Name = nameController.text.isEmpty
          ? widget.DonorModel.Name
          : nameController.text.trim();
      widget.DonorModel.Age = ageController.text.isEmpty
          ? widget.DonorModel.Age
          : int.parse(ageController.text.trim());
      widget.DonorModel.Phone = phoneController.text.isEmpty
          ? widget.DonorModel.Phone
          : int.parse(phoneController.text.trim());
      widget.DonorModel.Governorate = governorateController.text.isEmpty
          ? widget.DonorModel.Governorate
          : governorateController.text.trim();
      widget.DonorModel.City = cityController.text.isEmpty
          ? widget.DonorModel.City
          : cityController.text.trim();
      widget.DonorModel.BloodType = bloodTypeController.text.isEmpty
          ? widget.DonorModel.BloodType
          : bloodTypeController.text.trim();
      widget.DonorModel.LatestDonation = latestDonationController.text.isEmpty
          ? widget.DonorModel.LatestDonation
          : DateTime.now();
      widget.DonorModel.Condition = conditionController.text.isEmpty
          ? widget.DonorModel.Condition
          : conditionController.text.trim();
      widget.DonorModel.save();
      Navigator.pop(context);
    }
  }
}
