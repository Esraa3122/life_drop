import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/widgets/custom_button.dart';
import 'package:life_drop/core/common/widgets/custom_text_field.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/colors/colors_light.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/admin/add_notifications/data/models/add_notification_model.dart';

class EditNotificationBottomSheet extends StatefulWidget {
  const EditNotificationBottomSheet({
    required this.notificationModel,
    super.key,
  });

  final AddNotificationModel notificationModel;

  @override
  State<EditNotificationBottomSheet> createState() =>
      _EditNotificationBottomSheetState();
}

class _EditNotificationBottomSheetState
    extends State<EditNotificationBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController donorIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.notificationModel.title;
    bodyController.text = widget.notificationModel.body;
    donorIdController.text = widget.notificationModel.donorId.toString();
  }

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
                text: 'Edit Notifications',
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
              text: 'Edit the Notification title',
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
              text: 'Edit the Notification body',
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
              text: 'Edit the Product Id',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
            SizedBox(height: 20.h),
            // productId for notification TextForm
            CustomTextField(
              controller: donorIdController,
              keyboardType: TextInputType.number,
              validator: (value) {
                return null;
              },
              hintText: 'Produc id',
            ),
            SizedBox(height: 20.h),
            //Button
            CustomButton(
              onPressed: () {
                _validAddNotification(context);
              },
              backgroundColor: ColorsLight.white,
              lastRadius: 20,
              threeRadius: 20,
              textColor:  context.color.bluePinkDark,
              text: 'Edit a Notification',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }

  void _validAddNotification(BuildContext context) {
    if (formKey.currentState!.validate()) {
      widget.notificationModel.title = titleController.text.isEmpty
          ? widget.notificationModel.title
          : titleController.text.trim();
      widget.notificationModel.body = bodyController.text.isEmpty
          ? widget.notificationModel.body
          : bodyController.text.trim();
      widget.notificationModel.donorId = donorIdController.text.isEmpty
          ? widget.notificationModel.donorId
          : int.parse(donorIdController.text.trim());

      widget.notificationModel.save();
      Navigator.pop(context);
    }
  }
}