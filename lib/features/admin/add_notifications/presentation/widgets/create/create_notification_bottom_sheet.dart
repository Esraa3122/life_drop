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
import 'package:life_drop/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:life_drop/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';

class CreateNotificationBottomSheet extends StatefulWidget {
  const CreateNotificationBottomSheet({super.key});

  @override
  State<CreateNotificationBottomSheet> createState() =>
      _CreateNotificationBottomSheetState();
}

class _CreateNotificationBottomSheetState
    extends State<CreateNotificationBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController donorIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    donorIdController.dispose();
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
            //Add Notifications Title
            Center(
              child: TextApp(
                text: 'Add Notifications',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            //Enter the Notification name title
            TextApp(
              text: 'Enter the Notification title',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // title for notification TextForm
            CustomTextField(
              controller: titleController,
              hintText: 'Title',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Title Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),

            //Enter the Notification name body
            TextApp(
              text: 'Enter the Notification body',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // Body for notification TextForm
            CustomTextField(
              controller: bodyController,
              hintText: 'Body',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Body Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            //Enter the Product Id
            TextApp(
              text: 'Enter the Product Id',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // donorId for notification TextForm
            CustomTextField(
              controller: donorIdController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected Your Donorid ';
                }
                return null;
              },
              hintText: 'Donor id',
            ),
            SizedBox(height: 20.h),
            //Button
            BlocConsumer<AddNotificationBloc, AddNotificationState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    Navigator.pop(context);
                    ShowToast.showToastSuccessTop(
                      message: 'Notification Created Success',
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
                      child: Center(
                        child: CircularProgressIndicator(
                          color:  context.color.bluePinkDark,
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        _validAddNotification(context);
                      },
                      backgroundColor: ColorsLight.white,
                      lastRadius: 20,
                      threeRadius: 20,
                      textColor:  context.color.bluePinkDark,
                      text: 'Add a Notification',
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

  void _validAddNotification(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AddNotificationBloc>().add(
            AddNotificationEvent.createNotification(
              notificationModel: AddNotificationModel(
                title: titleController.text.trim(),
                body: bodyController.text.trim(),
                donorId: int.parse(donorIdController.text.trim()),
                createAt: DateTime.now(),
              ),
            ),
          );
    }
  }
}
