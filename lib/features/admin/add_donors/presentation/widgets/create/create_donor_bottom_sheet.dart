import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/toast/show_toast.dart';
import 'package:life_drop/core/common/widgets/custom_button.dart';
import 'package:life_drop/core/common/widgets/custom_text_field.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/colors/colors_light.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';

class CreateDonorBottomSheet extends StatefulWidget {
  const CreateDonorBottomSheet({super.key});

  @override
  State<CreateDonorBottomSheet> createState() => _CreateDonorBottomSheetState();
}

class _CreateDonorBottomSheetState extends State<CreateDonorBottomSheet> {
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
            //Add Donor Title
            Center(
              child: TextApp(
                text: 'Add Donor',
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
              text: 'Enter the Donor name',
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
              text: 'Enter the Donor age',
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
              text: 'Enter the Donor Phone',
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
              text: 'Enter the Donor Governorate',
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
              text: 'Enter the Donor City',
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
              text: 'Enter the Donor Blood Type',
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
              text: 'Enter the Donor Latest Donation',
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
              text: 'Enter the Donor Condition',
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
            BlocConsumer<AddDonorBloc, AddDonorState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    Navigator.pop(context);
                    ShowToast.showToastSuccessTop(
                      message: 'Donor Created Success',
                      seconds: 2,
                    );
                  },
                  error: (error) {
                    ShowToast.showToastErrorTop(
                      message: error,
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorsLight.pinkDark,
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        _validAddDonor(context);
                      },
                      backgroundColor: ColorsLight.white,
                      lastRadius: 20,
                      threeRadius: 20,
                      textColor: ColorsLight.pinkDark,
                      text: 'Add a Donor',
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validAddDonor(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AddDonorBloc>().add(AddDonorEvent.createDonor(
              donorModel: AddDonorModel(
            Name: nameController.text.trim(),
            Age: int.parse(ageController.text.trim()),
            Phone: int.parse(phoneController.text.trim()),
            Governorate: governorateController.text.trim(),
            City: cityController.text.trim(),
            Condition: conditionController.text.trim(),
            BloodType: bloodTypeController.text.trim(),
            LatestDonation: DateTime.now(),
          )));
    }
  }
}
